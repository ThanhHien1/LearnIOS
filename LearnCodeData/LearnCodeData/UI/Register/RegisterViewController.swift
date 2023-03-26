//
//  RegisterViewController.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 19/03/2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfImage: UITextField!
    @IBOutlet weak var btRegister: UIButton!
    @IBOutlet weak var iLoading: UIActivityIndicatorView!
    
    var users = UserDefaults.standard.array(forKey: Keys.allUserInApp) as? [Data] ?? []
    //let LoginViewController = LoginViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        iLoading.isHidden = true
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func OnSignInClick(_ sender: Any) {
        //imageURL = URL(string: tfImage.text ?? "")
        guard let email = tfEmail.text, let password = tfPassword.text, let name = tfName.text,
            let image = tfImage.text else {return}
        // ckeck email
        let existingUser = users.map { try! JSONDecoder().decode(User.self, from: $0) }
            .contains(where: { $0.email == email })
        if existingUser {return}
        let newUser = User(email: email, password: password, image: image, name: name)
        let encodedData = try? JSONEncoder().encode(newUser)
        users.append(encodedData!)
        // luu
        UserDefaults.standard.set(users, forKey: Keys.allUserInApp)
        iLoading.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [self] in
            self.iLoading.isHidden = true
            self.navigationController?.popViewController(animated: true)
        })
        
    }
    
}

