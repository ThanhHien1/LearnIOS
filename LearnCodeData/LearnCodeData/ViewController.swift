//
//  ViewController.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 13/03/2023.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var students = [Student]()

    @IBOutlet weak var studentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        students = DBManager.share.fetchStudent()
        studentTableView.reloadData()
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let aStudent = students[indexPath.row]
        cell.textLabel?.text = aStudent.name
        cell.detailTextLabel?.text = aStudent.school
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




