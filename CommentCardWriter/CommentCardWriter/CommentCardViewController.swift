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
    
    @IBOutlet var subjectOneLabel: UILabel!
    @IBOutlet var subjectTwoLabel: UILabel!
    @IBOutlet var subjectThreeLabel: UILabel!
    @IBOutlet var subjectFourLabel: UILabel!
    
    var subjectArray: [UILabel] = []
    var commentArray: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Comment Card"
        
        subjectArray = [subjectOneLabel, subjectTwoLabel, subjectThreeLabel, subjectFourLabel]
        commentArray = [subjectOneComment, subjectTwoComment, subjectThreeComment, subjectFourComment]
        
        subjectOneComment.text = commentCard[0].comment.write()
        subjectTwoComment.text = commentCard[1].comment.write()
        subjectThreeComment.text = commentCard[2].comment.write()
        subjectFourComment.text = commentCard[3].comment.write()
        
        for i in 0..<subjectArray.count {
            if commentCard[i].subject != "" {
                subjectArray[i].text = commentCard[i].subject
            }
            if commentCard[i].teacher != "" {
                subjectArray[i].text? += " - \(commentCard[i].teacher)"
            }
        }
    }
    
    @IBAction func startOver(_ sender: Any) {
        stageCount = 1
        commentCard.removeAll()
        guard let vc = storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController else {
            fatalError("Failed to load View Controller from Storyboard")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func editOne(_ sender: Any) {
        displayEditor(label: commentArray[0])
    }
    @IBAction func editTwo(_ sender: Any) {
        displayEditor(label: commentArray[1])
    }
    @IBAction func editThree(_ sender: Any) {
        displayEditor(label: commentArray[2])
    }
    @IBAction func editFour(_ sender: Any) {
        displayEditor(label: commentArray[3])
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
    
    @IBAction func storeCard(_ sender: Any) {
        var array = [String]()
        for comment in commentArray {
            array.append(comment.text ?? "")
        }
        commentCardComments.append(array)
        
        array.removeAll()
        for subject in subjectArray {
            array.append(subject.text ?? "")
        }
        commentCardSubjects.append(array)
        
        self.startOver("")
    }
    
}
