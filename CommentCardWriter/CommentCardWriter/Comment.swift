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
            comment += "At times, I feel as though I could put more effort in and this will be my target for next term. "
        }
        if sentiment.enjoyment {
            comment += "I have a real passion for this subject and am really enjoying the syllabus. "
        } else {
            comment += "Unfortunately, my passions lie elsewhere and I am not currently enjoying the syllabus. "
        }
        if sentiment.weakness == "" {
            comment += "At the moment, I don't think I have a weakness and am happy with my progression. "
        } else {
            comment += "My main weakness is \(sentiment.weakness) which is something that I am trying to overcome. "
        }
        if sentiment.strength == "" {
            comment += "I am not thriving as I would like to be and don't think I have any strengths to offer at this point in the academic year. "
        } else {
            comment += "On the other hand, I think that my \(sentiment.strength) will make me very successful in this subject and I am always keen to improve where I can."
        }
        while comment.count > maxLength {
            comment.removeLast()
        }
        return comment
    }
    
}
