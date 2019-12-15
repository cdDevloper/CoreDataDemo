//
//  Student+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Chaitanya Patil on 15/12/19.
//  Copyright © 2019 CDDevloper. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?

}
