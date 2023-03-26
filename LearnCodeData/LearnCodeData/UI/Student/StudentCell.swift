//
//  StudentCell.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 18/03/2023.
//

import Foundation
import UIKit

protocol StudentCellDelegate{
    func onStudentClick(student: Student) -> Void
}

class StudentCell: UITableViewCell{
    var delegate: StudentCellDelegate? = nil
    var student: Student? = nil
    
    @IBOutlet weak var school: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBAction func onCellClick(_ sender: Any) {
        if let s = student{
            delegate?.onStudentClick(student: s)
        }
    }
    
}
