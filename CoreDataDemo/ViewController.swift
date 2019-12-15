//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Chaitanya Patil on 08/12/19.
//  Copyright © 2019 CDDevloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataHandlingObj = DataHandling()
    override func viewDidLoad() {
        super.viewDidLoad()
        dataHandlingObj.addStudentRecordIntoCoreData(name: "Chaitanya", id: 1)
        dataHandlingObj.addStudentRecordIntoCoreData(name: "Shivaji", id: 1)
        
        dataHandlingObj.fetchAllRecords()
        
        dataHandlingObj.deleteRecord()
        
        dataHandlingObj.fetchAllRecords()
        
    }


}

