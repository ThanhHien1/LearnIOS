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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radiusButtonLogin()
        let token = UserDefaults.standard.string(forKey: Keys.token) ?? ""
        if(!token.isEmpty){
         // kiem tra token ton tai hay ko
            let vc = storyboard!.instantiateViewController(withIdentifier: "Students") as! StudentController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func radiusButtonLogin(){
        buttonLogin.layer.cornerRadius = 10
        buttonLogin.clipsToBounds = true
    }
    
    @IBAction func onLoginClick(_ sender: Any) {
        guard let email = tfEmail.text else {return }
        guard let password = tfPassword.text else {return}
        if(email == userDefault.email && password == userDefault.password){
            // save token
            UserDefaults.standard.set("TOKEN_!@#$%%&&57348247888", forKey: Keys.token)
            // save user
            let encodedData = try! JSONEncoder().encode(userDefault)
            UserDefaults.standard.set(encodedData,forKey :Keys.currentUser)
            
            // get user
            var userData = UserDefaults.standard.object(forKey: Keys.currentUser) as! Data
            if userData == userData {
                let userDefault = try! JSONDecoder().decode(User.self, from: userData)
                // print
                print(userDefault)
            }
            //
            if let currentUserData = UserDefaults.standard.data(forKey: Keys.currentUser),
               let userDefault = try? JSONDecoder().decode(User.self, from: currentUserData) {
               // user đã được lưu
                print("da luu")
            } else {
               // user chưa được lưu
                print("chua luu")
            }

            let vc = storyboard!.instantiateViewController(withIdentifier: "Students") as! StudentController
            navigationController?.pushViewController(vc, animated: true)
        }else{
            self.showAlertError(errorMessage: "Email and password invalid")
        }
    }
    
    
    private func showAlertError(errorMessage: String){
            let alert = UIAlertController(title: "Error",message: errorMessage,preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok",style: UIAlertAction.Style.default,handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
