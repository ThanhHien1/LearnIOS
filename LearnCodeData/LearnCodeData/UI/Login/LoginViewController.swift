//
//  LoginViewController.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 15/03/2023.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var btPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radiusButtonLogin()
        let token = UserDefaults.standard.string(forKey: Keys.token) ?? ""
        if(!token.isEmpty){
         // kiem tra token ton tai hay ko
            let vc = storyboard!.instantiateViewController(withIdentifier: ControllerName.listPerson) as! ListPersonViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func radiusButtonLogin(){
        buttonLogin.layer.cornerRadius = 10
        buttonLogin.clipsToBounds = true
    }
    
    @IBAction func onPassword(_ sender: Any) {
        tfPassword.isSecureTextEntry = !tfPassword.isSecureTextEntry
        let imageName = tfPassword.isSecureTextEntry ? "show-password" : "hide-password"
           btPassword.setImage(UIImage(named: imageName), for: .normal)
    }
    
    
    @IBAction func onSignUpClick(_ sender: Any) {
        let vc = storyboard!.instantiateViewController(withIdentifier: ControllerName.register) as! RegisterViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onLoginClick(_ sender: Any) {
        guard let email = tfEmail.text, let password = tfPassword.text else {return}
        // Lấy thông tin đã đăng ký từ UserDefaults
        let userData = UserDefaults.standard.array(forKey: Keys.allUserInApp)
        let users = userData?.compactMap { try? JSONDecoder().decode(User.self, from: $0 as! Data) }
        print(users ?? "" )
        if let user = (users?.first(where: { $0.email == email && $0.password == password })) {
                // Email và mật khẩu đúng, lưu token và chuyển đến màn hình
            UserDefaults.standard.set("TOKEN_!@#$%%&&57348247888", forKey: Keys.token)
            // save current
            if let data = try? JSONEncoder().encode(user) {
                UserDefaults.standard.set(data, forKey: Keys.current)
            }
            let vc = storyboard!.instantiateViewController(withIdentifier: ControllerName.listPerson) as! ListPersonViewController
            navigationController?.pushViewController(vc, animated: true)

            } else {
                // Email hoặc mật khẩu sai, hiển thị thông báo lỗi
                showAlertError(errorMessage: "Tài khoản hoặc mật khẩu không đúng.")
            }
        }
    
    
     func showAlertError(errorMessage: String){
            let alert = UIAlertController(title: "Error",message: errorMessage,preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok",style: UIAlertAction.Style.default,handler: nil))
            self.present(alert, animated: true, completion: nil)
        
        }
}
