//
//  Absence.swift
//  AbsenceRecorder
//
//  Created by Zack Obied on 05/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

class Absence {
    
    var takenOn: Date
    var present: [Student] = []
    var selectedRows: [IndexPath]?
    
    init(date: Date) {
        takenOn = date
    }
    
}
