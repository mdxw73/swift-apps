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
        
        if stageCount >= 8 {
            let finishButton = UIBarButtonItem(title: "Finish", style: .plain, target: self, action: #selector(nextStage))
            self.navigationItem.rightBarButtonItem = finishButton
        } else {
            let nextStageButton = UIBarButtonItem(image: UIImage(systemName: "arrow.right"), style: .plain, target: self, action: #selector(nextStage))
            self.navigationItem.rightBarButtonItem = nextStageButton
        }
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)

        if parent == nil {
            commentCard.removeLast()
            stageCount -= 1
        }
    }
    
    @objc func nextStage() {
        if stageCount >= 8 {
            guard let vc = storyboard?.instantiateViewController(identifier: "CommentCardViewController") as? CommentCardViewController else {
                fatalError("Failed to load Comment Card View Controller from Storyboard")
            }
            navigationController?.pushViewController(vc, animated: true)
        } else {
            stageCount += 1
            guard let vc = storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController else {
                fatalError("Failed to load View Controller from Storyboard")
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
