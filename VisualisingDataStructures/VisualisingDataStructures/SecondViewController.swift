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
    var tailCount = 0
    var headCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        headArray = [headOne, headTwo, headThree, headFour, headFive]
        tailArray = [tailZero, tailOne, tailTwo, tailThree, tailFour, tailFive]
        itemArray = [itemOne, itemTwo, itemThree, itemFour, itemFive]
        queue = Queue()
        headArray![0].image = UIImage(systemName: "hand.point.right")
        tailArray![0].image = UIImage(systemName: "hand.point.right")
        for i in 0..<itemArray!.count {
            itemArray![i].text = queue!.display()[i]
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
                self.display()
                if self.tailCount - self.headCount != self.tailArray!.count - 1 {
                    self.increaseTail()
                    self.tailCount += 1
                }
            }
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func popButton(_ sender: Any) {
        queue?.pop()
        display()
        if headCount != tailCount {
            increaseHead()
            headCount += 1
        }
    }
    
    func display() {
        let array = queue!.display()
        for i in 0..<array.count {
            itemArray![i].text = array[i]
        }
    }
    
    func increaseTail() {
        var count = 0
        var end = false
        while end == false && count < tailArray!.count {
            if tailArray![count].image != nil {
                tailArray![count].image = nil
                if count == tailArray!.count - 1 {
                    tailArray![1].image = UIImage(systemName: "hand.point.right")
                } else {
                    tailArray![count + 1].image = UIImage(systemName: "hand.point.right")
                }
                end = true
            }
            count += 1
        }
    }
    
    func increaseHead() {
        var count = 0
        var end = false
        while end == false && count < headArray!.count {
            if headArray![count].image != nil {
                headArray![count].image = nil
                if count == headArray!.count - 1 {
                    headArray![0].image = UIImage(systemName: "hand.point.right")
                } else {
                    headArray![count + 1].image = UIImage(systemName: "hand.point.right")
                }
                end = true
            }
            count += 1
        }
    }

}
