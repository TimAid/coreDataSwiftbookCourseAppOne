//
//  dataStorageManager.swift
//  coreDataSwiftbookCourseAppOne
//
//  Created by Aid on 06.10.2022.
//

import Foundation
import CoreData


class DataStorageManager {
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "coreDataSwiftbookCourseAppOne")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    //: get viewContext
    public var viewContext : NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
    func delete() {
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskEntity")
        
        if let tasks = try? viewContext.fetch(fetchRequest) as? [TaskEntity] {
            guard let taskMain = tasks.first else {return}
                viewContext.delete(taskMain)
                try? viewContext.save()
        }
    }
    
    // код содания и записи объекта
    func save(newTask: String) {
        let task = NSEntityDescription.insertNewObject(forEntityName: "TaskEntity", into: viewContext) as! TaskEntity
        
        task.name = newTask
        
        do {
            try viewContext.save()
            print("successfully saved")
        } catch {
            print("Could not save")
        }
    }
    
    func fetch() -> [TaskEntity] {
        var taskInfoData = [TaskEntity]()
        
        do {
            taskInfoData = try viewContext.fetch(TaskEntity.fetchRequest())
        } catch {
            print("Could not fetch")
        }
        
        return taskInfoData
    }
    
}
