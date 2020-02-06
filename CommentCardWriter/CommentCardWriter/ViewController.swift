//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Zack Obied on 06/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var effortSwitch: UISwitch!
    @IBOutlet var enjoymentSwitch: UISwitch!
    
    @IBOutlet var distractionSwitch: UISwitch!
    @IBOutlet var confidenceSwitch: UISwitch!
    @IBOutlet var organisationSwitch: UISwitch!
    
    @IBOutlet var focusSwitch: UISwitch!
    @IBOutlet var commitmentSwitch: UISwitch!
    @IBOutlet var creativitySwitch: UISwitch!
    
    var student: String = ""
    var commentCard: [SubjectCard] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayAlert() {
        let alertController = UIAlertController(title: "Name Your Tamagotchi", message: "Enter a name", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.text = ""
        }
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alertController] (_) in
            let textField = alertController?.textFields![0]
            self.student = textField!.text ?? "Student"
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func nextStage(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "SubjectCardViewController") as? SubjectCardViewController else {
            fatalError("Failed to load Subject Card View Controller from Storyboard")
        }
        self.commentCard.append(SubjectCardGenerator.generateSubjectCard(effort: effort, enjoyment: enjoyment, weakness: weakness, strength: strength, maxLength: maxLength, subject: subject, teacher: teacher))
        vc.subjectCard = commentCard.last
        navigationController?.pushViewController(vc, animated: true)
    }
    
    let subject: String = "Computer Science"
    let teacher: String = "DPC"
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

}

