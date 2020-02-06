//
//  CommentCardViewController.swift
//  CommentCardWriter
//
//  Created by Zack Obied on 06/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

class CommentCardViewController: UIViewController {
    
    @IBOutlet var subjectOneComment: UILabel!
    @IBOutlet var subjectTwoComment: UILabel!
    @IBOutlet var subjectThreeComment: UILabel!
    @IBOutlet var subjectFourComment: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Comment Card"
        
        subjectOneComment.text = commentCard[0].comment.write()
        subjectTwoComment.text = commentCard[1].comment.write()
        subjectThreeComment.text = commentCard[2].comment.write()
        subjectFourComment.text = commentCard[3].comment.write()
    }

}
