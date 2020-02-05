//
//  DivisionFactory.swift
//  AbsenceRecorder
//
//  Created by Zack Obied on 28/01/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

class DivisionFactory {
    
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code: code)
        for i in 1...size {
            division.students.append(Student(forename: "Forename\(i)", surname: "Surname\(i)", birthday: Date()))
        }
        return division
    }
    
}
