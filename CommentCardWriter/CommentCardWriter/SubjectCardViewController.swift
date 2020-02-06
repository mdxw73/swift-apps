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
        
        let nextStage = UIBarButtonItem(image: UIImage(systemName: "arrow.right"), style: .plain, target: self, action: #selector(nextStageButton))
        self.navigationItem.rightBarButtonItem = nextStage
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)

        if parent == nil {
            commentCard.removeLast()
        }
    }
    
    @objc func nextStageButton() {
        commentCard.append(subjectCard!)
        guard let vc = storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController else {
            fatalError("Failed to load Subject Card View Controller from Storyboard")
        }
        navigationController?.pushViewController(vc, animated: true)
    }

}
