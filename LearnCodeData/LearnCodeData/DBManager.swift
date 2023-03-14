//
//  DBManager.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 13/03/2023.
//
import UIKit
import CoreData

class DBManager
{
    static let share = DBManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
    
        let container = NSPersistentContainer(name: "LearnCodeData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    lazy var context = persistentContainer.viewContext
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchStudent() -> [Student]
    {
        var student = [Student]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Student.description())
        
        do{
            student = try context.fetch(fetchRequest) as! [Student]
        
        }
        catch{
            print("fecthing error")
        }
            return student
    }
}

