//
//  SubjectCard.swift
//  CommentCardWriter
//
//  Created by Zack Obied on 06/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

class SubjectCard {
    
    let subject: String
    let teacher: String
    let comment: Comment
    
    init(subject: String, teacher: String, comment: Comment) {
        self.subject = subject
        self.teacher = teacher
        self.comment = comment
    }
    
}
