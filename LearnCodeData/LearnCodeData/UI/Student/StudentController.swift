//
//  ViewController.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 13/03/2023.
//

import UIKit
import CoreData

class StudentController: UIViewController {
    
    var students = [Student]()
    @IBOutlet weak var btnLogout: UIBarButtonItem!
    
    @IBOutlet weak var studentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        students = DBManager.share.fetchStudent()
        //studentTableView.reloadData()
    }
    @IBAction func onLogoutClick(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: Keys.token)
        UserDefaults.standard.removeObject(forKey: Keys.currentUser)
        navigationController?.popViewController(animated: true)
    }
}




extension StudentController: UITableViewDelegate, UITableViewDataSource, StudentCellDelegate{
    
    func onStudentClick(student: Student) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailStudent") as! DetailController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StudentCell
        let aStudent = students[indexPath.row]
        cell.name?.text = aStudent.name
        cell.school?.text = aStudent.school
        cell.student = aStudent
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            do{
                try DBManager.share.context.delete(students[indexPath.row])
               }catch{
                print("error  in delecting")
            }
            DBManager.share.saveContext()
            students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}




