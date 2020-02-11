//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Zack Obied on 06/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

var commentCard: [SubjectCard] = []
var stageCount = 1

class ViewController: UIViewController {
    
    @IBOutlet var effortSwitch: UISwitch!
    @IBOutlet var enjoymentSwitch: UISwitch!
    
    @IBOutlet var distractionSwitch: UISwitch!
    @IBOutlet var confidenceSwitch: UISwitch!
    @IBOutlet var organisationSwitch: UISwitch!
    
    @IBOutlet var focusSwitch: UISwitch!
    @IBOutlet var commitmentSwitch: UISwitch!
    @IBOutlet var creativitySwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        let index = navigationController?.viewControllers.count ?? 1
        if index > 1 && navigationController?.viewControllers[index - 2] is CommentCardViewController {
            self.navigationItem.setHidesBackButton(true, animated: true) // Hides default back button when the previous view controller on the stack is a Comment Card View Controller
        }
        navigationItem.title = "Subject \(stageCount/2 + 1)"
    }
    
    @IBAction func subjectCard(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "SubjectCardViewController") as? SubjectCardViewController else {
            fatalError("Failed to load Subject Card View Controller from Storyboard")
        }
        stageCount += 1
        commentCard.append(SubjectCardGenerator.generateSubjectCard(effort: effort, enjoyment: enjoyment, weakness: weakness, strength: strength, maxLength: maxLength, subject: subject, teacher: teacher))
        vc.subjectCard = commentCard.last
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)

        if parent == nil {
            stageCount -= 1
        }
    }
    
    var subject: String = ""
    var teacher: String = ""
    let maxLength: Int = 500
    
    var effort: Bool = false
    var enjoyment: Bool = false
    var weakness: String = ""
    var strength: String = ""
    
    @IBAction func effortToggle(_ sender: Any) {
        if effortSwitch.isOn {
            effort = true
        } else {
            effort = false
        }
    }
    @IBAction func enjoymentToggle(_ sender: Any) {
        if enjoymentSwitch.isOn {
            enjoyment = true
        } else {
            enjoyment = false
        }
    }
    @IBAction func distractionToggle(_ sender: Any) {
        if distractionSwitch.isOn {
            weakness = "distraction"
            confidenceSwitch.isEnabled = false
            organisationSwitch.isEnabled = false
        } else {
            weakness = ""
            confidenceSwitch.isEnabled = true
            organisationSwitch.isEnabled = true
        }
    }
    @IBAction func confidenceToggle(_ sender: Any) {
        if confidenceSwitch.isOn {
            weakness = "confidence"
            distractionSwitch.isEnabled = false
            organisationSwitch.isEnabled = false
        } else {
            weakness = ""
            distractionSwitch.isEnabled = true
            organisationSwitch.isEnabled = true
        }
    }
    @IBAction func organisationToggle(_ sender: Any) {
        if organisationSwitch.isOn {
            weakness = "organisation"
            confidenceSwitch.isEnabled = false
            distractionSwitch.isEnabled = false
        } else {
            weakness = ""
            confidenceSwitch.isEnabled = true
            distractionSwitch.isEnabled = true
        }
    }
    @IBAction func focusToggle(_ sender: Any) {
        if focusSwitch.isOn {
            strength = "focus"
            commitmentSwitch.isEnabled = false
            creativitySwitch.isEnabled = false
        } else {
            strength = ""
            commitmentSwitch.isEnabled = true
            creativitySwitch.isEnabled = true
        }
    }
    @IBAction func commitmentToggle(_ sender: Any) {
        if commitmentSwitch.isOn {
            strength = "commitment"
            focusSwitch.isEnabled = false
            creativitySwitch.isEnabled = false
        } else {
            strength = ""
            focusSwitch.isEnabled = true
            creativitySwitch.isEnabled = true
        }
    }
    @IBAction func creativityToggle(_ sender: Any) {
        if creativitySwitch.isOn {
            strength = "creativity"
            focusSwitch.isEnabled = false
            commitmentSwitch.isEnabled = false
        } else {
            strength = ""
            focusSwitch.isEnabled = true
            commitmentSwitch.isEnabled = true
        }
    }
    
    @IBAction func addSubject(_ sender: Any) {
        let alert = UIAlertController(title: "Enter Subject Name", message: "e.g. Maths", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { textField in
            textField.text = ""
            })
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (_) in
            let textField = alert.textFields![0]
            self.subject = textField.text ?? ""
            self.navigationItem.title = self.subject
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func addTeacher(_ sender: Any) {
        let alert = UIAlertController(title: "Enter Teacher Initials", message: "e.g. DPC", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { textField in
            textField.text = ""
            })
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (_) in
            let textField = alert.textFields![0]
            self.teacher = textField.text ?? ""
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

