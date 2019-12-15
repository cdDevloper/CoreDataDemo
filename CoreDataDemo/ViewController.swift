//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Chaitanya Patil on 08/12/19.
//  Copyright © 2019 CDDevloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

       override func viewDidLoad() {
        super.viewDidLoad()
        //1. Using Coding
        let dataHandlingObj = DataHandling()
        //Records Added
        dataHandlingObj.addStudentRecordIntoCoreData(name: "Chaitanya", id: 1)
        dataHandlingObj.addStudentRecordIntoCoreData(name: "Shivaji", id: 1)
        
        //Fetch Records
        dataHandlingObj.fetchAllRecords()
        
        //Delete Records
        dataHandlingObj.deleteRecord()
        
        //2. Using Object Oriented Style
        let objOrientedStyle = ObjectOrientedStyle()
        //Records Added
        objOrientedStyle.addStudentRecordIntoCoreData(name: "Chaitanya", id: 1)
        objOrientedStyle.addStudentRecordIntoCoreData(name: "Shivaji", id: 1)
        
        //Fetch Records
        objOrientedStyle.fetchAllRecords()
        
        //Delete Records
        objOrientedStyle.deleteRecord()    }


}

