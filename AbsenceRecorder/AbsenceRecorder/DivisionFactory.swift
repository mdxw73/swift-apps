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
        for _ in 1...size {
            division.students.append(Student(forename: "John", surname: "Appleseed", birthday: Date()))
        }
        return division
    }
}
