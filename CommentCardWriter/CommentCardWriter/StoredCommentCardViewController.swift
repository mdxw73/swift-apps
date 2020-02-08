//
//  StoredCommentCardViewController.swift
//  CommentCardWriter
//
//  Created by Zack Obied on 08/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

class StoredCommentCardViewController: UIViewController {
    
    @IBOutlet var subjectOneComment: UILabel!
    @IBOutlet var subjectTwoComment: UILabel!
    @IBOutlet var subjectThreeComment: UILabel!
    @IBOutlet var subjectFourComment: UILabel!
    
    @IBOutlet var subjectOneLabel: UILabel!
    @IBOutlet var subjectTwoLabel: UILabel!
    @IBOutlet var subjectThreeLabel: UILabel!
    @IBOutlet var subjectFourLabel: UILabel!
    
    var commentArray: [String] = ["","","",""]
    var subjectArray: [String] = ["","","",""]
    var commentLabelArray: [UILabel] = []
    var subjectLabelArray: [UILabel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Stored Comment Card"
        
        subjectLabelArray = [subjectOneLabel, subjectTwoLabel, subjectThreeLabel, subjectFourLabel]
        commentLabelArray = [subjectOneComment, subjectTwoComment, subjectThreeComment, subjectFourComment]
        for i in 0..<commentArray.count {
            commentLabelArray[i].text = commentArray[i]
        }
        for i in 0..<subjectArray.count {
            subjectLabelArray[i].text = subjectArray[i]
        }
    }
    
    @IBAction func editOne(_ sender: Any) {
        displayEditor(label: commentLabelArray[0])
    }
    @IBAction func editTwo(_ sender: Any) {
        displayEditor(label: commentLabelArray[1])
    }
    @IBAction func editThree(_ sender: Any) {
        displayEditor(label: commentLabelArray[2])
    }
    @IBAction func editFour(_ sender: Any) {
        displayEditor(label: commentLabelArray[3])
    }
    
    func displayEditor(label: UILabel) {
        let alert = UIAlertController(title: "Subject Editor", message: "You can edit or copy the following comment:", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { textField in
            textField.text = label.text
            })
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (_) in
            let textField = alert.textFields![0]
            label.text = textField.text ?? label.text
        }))
        self.present(alert, animated: true, completion: nil)
    }

}
