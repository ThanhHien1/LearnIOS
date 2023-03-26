//
//  Users+CoreDataProperties.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 20/03/2023.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var email: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?

}

extension Users : Identifiable {

}
