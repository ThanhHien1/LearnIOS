//
//  Student+CoreDataProperties.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 20/03/2023.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var school: String?
    @NSManaged public var std: String?

}

extension Student : Identifiable {

}
