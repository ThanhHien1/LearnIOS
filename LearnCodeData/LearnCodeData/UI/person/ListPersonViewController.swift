//
//  ListPersonViewController.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 23/03/2023.
//

import UIKit

class ListPersonViewController: UIViewController {
    
    @IBOutlet weak var iLoading: UIActivityIndicatorView!
    var persons = [Person]()
    var imageCache = [String: UIImage]()
    
    @IBOutlet weak var tableViewPerson: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iLoading.isHidden = true
        tableViewPerson.dataSource = self
        tableViewPerson.delegate = self
        UrlSessionManager.share.getListPerson( size: 10, completed: { [weak self] persons in
            self?.iLoading?.isHidden = true
            self?.persons = persons
            self?.tableViewPerson.reloadData()
        }, startGet: {[weak self] in
            self?.iLoading.isHidden = false
        })
    }
    
    
    @IBAction func onProfile(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Profile") as! ProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ListPersonViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPerson", for: indexPath) as! TableViewCell
        let aPerson = persons[indexPath.row]
        cell.lbName?.text = "\(aPerson.firstName) \(aPerson.lastName)"
        cell.lbAddress?.text = "\(aPerson.address.city) \(aPerson.address.country)"
        let imageString = aPerson.avatar
        UrlSessionManager.share.getImage(pictureString: imageString, completed: {
            image in
            cell.imageAvatar?.image = image
        })
        return cell
    }
}


