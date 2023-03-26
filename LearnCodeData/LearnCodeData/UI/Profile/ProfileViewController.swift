//
//  ProfileViewController.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 19/03/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataProfile()
        layoutImage()
    
    }
    
    @IBAction func onLogoutClick(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: Keys.token)
        UserDefaults.standard.removeObject(forKey: Keys.allUserInApp)
        navigationController?.popViewController(animated: true)
    }
    
    
    private func layoutImage() {
        //imageAvatar.layer.cornerRadius = bounds.width/2
        viewImage?.layer.cornerRadius = viewImage.bounds.width / 2
        viewImage?.layer.borderWidth = 1
        viewImage?.layer.borderColor = UIColor.gray.cgColor
        viewImage?.clipsToBounds = true
        viewImage?.contentMode = .scaleAspectFill
    }
    
    func fetchDataProfile() {
        if let usersData = UserDefaults.standard.object(forKey: Keys.current)  as? Data{
            let users = try? JSONDecoder().decode(User.self, from: usersData )
            let name = users?.name
                        tfName.text = name
            let password = users?.password
                        tfPassword.text = password
            let email = users?.email
                        tfEmail.text = email
            let imageURL = users?.image
            UrlSessionManager.share.getImage(pictureString: imageURL, completed: {
                image in
                DispatchQueue.main.async {
                    self.viewImage.image = image
                }})
        }
  }
    
}
