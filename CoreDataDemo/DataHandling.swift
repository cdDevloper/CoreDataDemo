//
//  DataHandling.swift
//  CoreDataDemo
//
//  Created by Chaitanya Patil on 14/12/19.
//  Copyright © 2019 CDDevloper. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class DataHandling : NSObject{
    
    func addStudentRecordIntoCoreData(name:String,id:Int){
        //1 create appdelegate Singleton object
        guard  let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return }
        
        //2.Access persistentContainer from appdelegate Singleton object and Access the singleton managed object context
        let viewContext = appdelegate.persistentContainer.viewContext
        
        //3. Create an entity
        
        if let studEntity = NSEntityDescription.entity(forEntityName: "Student", in: viewContext){
            //4. Create managed object
            let stud = NSManagedObject(entity: studEntity, insertInto: viewContext)
            stud.setValue(id, forKey: "id")
            stud.setValue(name, forKey: "name")
        }
        
       //5. Save to persistent store
        if viewContext.hasChanges{
            do{
                try viewContext.save()
                print("Save")
            }catch let error as NSError{
                print("not Save==\(error),\(error.userInfo)")
            }
        }
        
    }
    
    func fetchAllRecords(){
        //1 create appdelegate Singleton object
        guard  let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return }
        
        //2.Access persistentContainer from appdelegate Singleton object and Access the singleton managed object context
        let viewContext = appdelegate.persistentContainer.viewContext
        
        //3. Creating fetch request using this we can only filter NSManagedObject having entity name Student.
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        
        do{
            //4. Execute request
            let studs = try viewContext.fetch(fetchRequest)
            for (index,stud) in studs.enumerated(){
            //5. Access Data
                print("\(index). \(stud.value(forKey: "name") ?? "No Name Available")")
            }
        }catch let error as NSError{
            print("not fetch==\(error),\(error.userInfo)")
        }
    }
    
    func deleteRecord(){
        //1 create appdelegate Singleton object
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
        
        //2.Access persistentContainer from appdelegate Singleton object and Access the singleton managed object context
        let viewContext = appDelegate.persistentContainer.viewContext
        
        //3. Creating fetch request using this we can only filter NSManagedObject having entity name Student.
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        
        do{
            //4. Access Revords
            let studs = try viewContext.fetch(fetchRequest)
            
            for stud in studs{
            //5. Delete Record
                viewContext.delete(stud)
                print("Deleted \(stud.value(forKey: "name") ?? "No Name Available")")
            }
        }catch let error as NSError{
            print("not deleted==\(error),\(error.userInfo)")
        }
        
        if viewContext.hasChanges{
            do{
                //6. Commit changes
                try viewContext.save()
            }catch let error as NSError{
                print("not save==\(error),\(error.userInfo)")
            }
        }
        
    }
}
