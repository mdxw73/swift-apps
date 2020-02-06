//
//  CommentCardGenerator.swift
//  CommentCardWriter
//
//  Created by Zack Obied on 06/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

class SubjectCardGenerator {
    
    static func generateSubjectCard(effort: Bool, enjoyment: Bool, weakness: String, strength: String, maxLength: Int, subject: String, teacher: String) -> SubjectCard {
        let sentiment = Sentiment(effort: effort, enjoyment: enjoyment, weakness: weakness, strength: strength)
        let comment = Comment(sentiment: sentiment, maxLength: maxLength)
        return SubjectCard(subject: subject, teacher: teacher, comment: comment)
    }
    
}
