//
//  Division.swift
//  AbsenceRecorder
//
//  Created by Zack Obied on 28/01/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

class Division {
    
    let code: String
    var students: [Student] = []
    var absences: [Absence] = []
    
    init(code: String) {
        self.code = code
    }
    
    func getAbsence(for date: Date) -> Absence? {
        return absences.first { $0.takenOn == date }
    }
    
    func removeAbsence(for date: Date) {
        absences.removeAll { $0.takenOn == date }
    }
    
}
