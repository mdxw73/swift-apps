//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Zack Obied on 06/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

class Comment {
    
    let sentiment: Sentiment
    let maxLength: Int
    
    init(sentiment: Sentiment, maxLength: Int) {
        self.sentiment = sentiment
        self.maxLength = maxLength
    }
    
    func write() -> String {
        var comment = ""
        if sentiment.effort {
            comment += "I am putting in a lot of effort both in class and outside. "
        } else {
            comment += "At times, I feel as though I could put more effort in which will be my aim in the future. "
        }
        if sentiment.enjoyment {
            comment += "I have a passion for this subject and am really enjoying the syllabus. "
        } else {
            comment += "Unfortunately, my passions lie elsewhere and I am not currently enjoying the syllabus. "
        }
        comment += "My main weakness is \(sentiment.weakness) which is something that I am trying to overcome. "
        comment += "On the other hand I think that my \(sentiment.strength) makes up for this but I am always keen to improve where I can."
        while comment.count > maxLength {
            comment.removeLast()
        }
        return comment
    }
    
}
