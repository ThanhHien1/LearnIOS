//
//  DetailController.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 18/03/2023.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var lbFGender: UITextField!
    @IBOutlet weak var lbname: UITextField!
    @IBOutlet weak var lbLocation: UITextField!
    @IBOutlet weak var lbnat: UITextField!
    @IBOutlet weak var lbID: UITextField!
    @IBOutlet weak var lbPhone: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0, execute: { [self] in
            self.fetchData()
        })
        // Do any additional setup after loading the view.
    }


    func fetchData(){
        UrlSessionManager.share.getUser { [self] user in
            self.loading.isHidden = true
            
            let name = user.results.first?.name
            self.lbname.text = "\(name?.first ?? "") \(name?.last ?? "")"
            
            let gender = user.results.first?.gender
            self.lbFGender.text = gender ?? ""
            
            let location = user.results.first?.location
            self.lbLocation.text = "\(location?.city ?? "") \(location?.state ?? "")"
            
            let nat = user.results.first?.nat
            self.lbnat.text = nat
            
            let phone = user.results.first?.phone
            self.lbPhone.text = phone
            
            let id = user.results.first?.id
            self.lbID.text = id?.value ?? ""
            
            let pictureString = user.results.first?.picture
            //let pictureThumbnail = URL(String: pictureString?.thumbnail ?? "")
            let pictureMedium = URL(string: pictureString?.medium ?? "")
            URLSession.shared.dataTask(with: pictureMedium!) { (data, response, error) in
                if let error = error {
                    print("Error fetching image: \(error.localizedDescription)")
                    return
                }
                guard let data = data, let image = UIImage(data: data) else {
                    print("Invalid image data")
                    return
                }
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }.resume()
            
        
            
        } startGet: {[self] in
            self.loading.isHidden = false
        }

    }

}
