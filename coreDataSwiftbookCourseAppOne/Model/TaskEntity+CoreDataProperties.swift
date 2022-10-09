//
//  TaskEntity+CoreDataProperties.swift
//  coreDataSwiftbookCourseAppOne
//
//  Created by Aid on 06.10.2022.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var name: String?

}

extension TaskEntity : Identifiable {

}
