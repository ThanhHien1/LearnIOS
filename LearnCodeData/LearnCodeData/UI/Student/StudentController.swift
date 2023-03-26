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
    // @IBOutlet weak var btnLogout: UIBarButtonItem!
    @IBOutlet weak var studentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        students = DBManager.share.fetchStudent()
        //studentTableView.reloadData()
    }
    
    // profile
    @IBAction func onClickProfile(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Profile") as! ProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}


extension StudentController: UITableViewDelegate, UITableViewDataSource, StudentCellDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailStudent") as! DetailController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func onStudentClick(student: Student) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailStudent") as! DetailController
//        self.navigationController?.pushViewController(vc, animated: true)
        //vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true)
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
    
    // remove student
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            DBManager.share.context.delete(students[indexPath.row])
            DBManager.share.saveContext()
            students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}




