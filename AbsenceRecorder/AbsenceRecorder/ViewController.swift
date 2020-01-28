//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Zack Obied on 28/01/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var divisions: [Division] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addDummyData()
        for division in divisions {
            print(division.code, division.students.count)
            for student in division.students {
                print(student.forename, student.surname)
            }
        }
    }
    
    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "BY-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "XC-1", of: 9))
        divisions.append(DivisionFactory.createDivision(code: "DV-1", of: 10))
    }

}
