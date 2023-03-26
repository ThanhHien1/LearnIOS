//
//  UrlSessionManager.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 18/03/2023.
//

import Foundation
import UIKit

class UrlSessionManager {
    static let share = UrlSessionManager()
    
    private init(){}
    
    func getUser(completed: @escaping (UserResponse) -> Void, startGet: @escaping () -> Void){
        startGet()
        guard let url = URL(string: "https://randomuser.me/api/") else{return}
        URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: { data, response, error in
            if let err = error{
                print(err)
            }else if let _data = data {
                do{
                    let userResponse = try JSONDecoder().decode(UserResponse.self, from: _data)
                    DispatchQueue.main.async {completed(userResponse)}
                }catch let error{
                    print("Loi \(error.localizedDescription)")
                }
            }
        }).resume()
    }
    
    func getListPerson(size:Int, completed: @escaping ([Person]) -> Void, startGet: @escaping () -> Void){
        startGet()
        //https://random-data-api.com/api/v2/users?size=10
        guard let url = URL(string: "https://random-data-api.com/api/v2/users?size=\(size)") else{return}
        URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: { data, response, error in
            if let err = error{
                print(err)
            }else if let _data = data {
                do{
                    let personResponse = try JSONDecoder().decode([Person].self, from: _data)
                    DispatchQueue.main.async {completed(personResponse)}
                }catch let error{
                    print("Loi khong dung dinh d\(error.localizedDescription) ")
                }
            }
        }).resume()
    }
    
    func getImage(pictureString: String?, completed: @escaping (UIImage?) -> Void) {
        guard let pictureString = pictureString, let pictureMedium = URL(string: pictureString) else {
            completed(nil)
            return
        }
        URLSession.shared.dataTask(with: pictureMedium) { (data, response, error) in
            if let error = error {
                print("Error fetching image: \(error.localizedDescription)")
                completed(nil)
                return
            }
            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid image data")
                completed(nil)
                return
            }
            DispatchQueue.main.async {
                completed(image)
            }
        }.resume()
    }
}

