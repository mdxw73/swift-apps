//
//  UserDocumentManager.swift
//  AbsenceRecorder
//
//  Created by Zack Obied on 08/03/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

class UserDocumentManager {
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
