//
//  Absence.swift
//  AbsenceRecorder
//
//  Created by Zack Obied on 05/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

class Absence: Equatable, Codable {
    
    var takenOn: Date
    var present: [Student] = []
    
    init(date: Date) {
        takenOn = date
    }
    
    init(date: Date, present: [Student]) {
        takenOn = date
        self.present = present
    }
    
    static func == (lhs: Absence, rhs: Absence) -> Bool {
        return lhs.present == rhs.present && lhs.takenOn == rhs.takenOn
    }
    
}
