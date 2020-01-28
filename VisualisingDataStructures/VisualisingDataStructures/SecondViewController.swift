//
//  SecondViewController.swift
//  VisualisingDataStructures
//
//  Created by Obied, Zack (NA) on 28/01/2020.
//  Copyright © 2020 Obied, Zack (NA). All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var itemOne: UILabel!
    @IBOutlet var itemTwo: UILabel!
    @IBOutlet var itemThree: UILabel!
    @IBOutlet var itemFour: UILabel!
    @IBOutlet var itemFive: UILabel!
    @IBOutlet var headOne: UIImageView!
    @IBOutlet var headTwo: UIImageView!
    @IBOutlet var headThree: UIImageView!
    @IBOutlet var headFour: UIImageView!
    @IBOutlet var headFive: UIImageView!
    @IBOutlet var tailZero: UIImageView!
    @IBOutlet var tailOne: UIImageView!
    @IBOutlet var tailTwo: UIImageView!
    @IBOutlet var tailThree: UIImageView!
    @IBOutlet var tailFour: UIImageView!
    @IBOutlet var tailFive: UIImageView!

    
    var queue: Queue?
    var headArray: [UIImageView]?
    var tailArray: [UIImageView]?
    var itemArray: [UILabel]?
    var currentTail = 0
    var currentHead = 0
    var tailCount = 0
    var headCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        headArray = [headOne, headTwo, headThree, headFour, headFive]
        tailArray = [tailZero, tailOne, tailTwo, tailThree, tailFour, tailFive]
        itemArray = [itemOne, itemTwo, itemThree, itemFour, itemFive]
        queue = Queue()
        headArray?[currentHead].image = UIImage(systemName: "hand.point.right")
        tailArray?[currentTail].image = UIImage(systemName: "hand.point.right")
        for i in 0..<itemArray!.count {
            itemArray![i].text = "Empty"
        }
    }
    
    @IBAction func pushButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Push", message: "Enter an item", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.text = ""
        }
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alertController] (_) in
            let textField = alertController?.textFields![0]
            if textField!.text!.count < 20 && textField!.text!.count > 0 {
                self.queue?.push(textField!.text!)
                if self.tailCount - self.headCount != self.tailArray!.count - 1 {
                    if self.currentTail == self.tailArray!.count - 1 {
                        self.currentTail = 1
                        self.tailCount += 1
                        self.tailArray?[self.tailArray!.count - 1].image = nil
                        self.tailArray?[self.currentTail].image = UIImage(systemName: "hand.point.right")
                        self.itemArray?[self.currentTail - 1].text = textField!.text!
                    } else {
                        self.currentTail += 1
                        self.tailCount += 1
                        self.tailArray?[self.currentTail - 1].image = nil
                        self.tailArray?[self.currentTail].image = UIImage(systemName: "hand.point.right")
                        self.itemArray?[self.currentTail - 1].text = textField!.text!
                    }
                }
            }
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func popButton(_ sender: Any) {
        queue?.pop()
        if self.headCount != self.tailCount {
            if self.currentHead == self.headArray!.count - 1 {
                self.currentHead = 0
                self.headCount += 1
                self.headArray?[self.headArray!.count - 1].image = nil
                self.headArray?[self.currentHead].image = UIImage(systemName: "hand.point.right")
            } else {
                self.currentHead += 1
                self.headCount += 1
                self.headArray?[self.currentHead - 1].image = nil
                self.headArray?[self.currentHead].image = UIImage(systemName: "hand.point.right")
            }
        }
        
    }

}
