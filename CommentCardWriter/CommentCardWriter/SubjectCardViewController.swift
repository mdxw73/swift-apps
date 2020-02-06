//
//  SubjectCardViewController.swift
//  CommentCardWriter
//
//  Created by Zack Obied on 06/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

class SubjectCardViewController: UIViewController {
    
    @IBOutlet var comment: UILabel!
    
    var subjectCard: SubjectCard?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Subject Card"
        comment.text = subjectCard?.comment.write()
    }

}
