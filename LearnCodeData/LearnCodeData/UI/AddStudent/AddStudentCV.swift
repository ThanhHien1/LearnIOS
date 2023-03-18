//
//  AddStudentCV.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 13/03/2023.
//

import UIKit

class AddStudentCV: UIViewController {
    
    @IBOutlet weak var txtSTD: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSchool: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onClickAdd(_ sender: Any) {
        if let name = txtName.text, let school = txtSchool.text, let std = txtSTD.text
        {
            let newStudent = Student(context: DBManager.share.context)
            newStudent.name = name
            newStudent.school = school
            newStudent.std = std
            
            DBManager.share.saveContext()
        }
    }
}

