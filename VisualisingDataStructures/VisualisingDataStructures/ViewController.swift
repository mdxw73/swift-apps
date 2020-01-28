//
//  ViewController.swift
//  VisualisingDataStructures
//
//  Created by Obied, Zack (NA) on 27/01/2020.
//  Copyright © 2020 Obied, Zack (NA). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var itemOne: UILabel!
    @IBOutlet var itemTwo: UILabel!
    @IBOutlet var itemThree: UILabel!
    @IBOutlet var itemFour: UILabel!
    @IBOutlet var itemFive: UILabel!
    @IBOutlet var pointerZero: UIImageView!
    @IBOutlet var pointerOne: UIImageView!
    @IBOutlet var pointerTwo: UIImageView!
    @IBOutlet var pointerThree: UIImageView!
    @IBOutlet var pointerFour: UIImageView!
    @IBOutlet var pointerFive: UIImageView!
    
    var stack: Stack?
    var pointerArray: [UIImageView]?
    var itemArray: [UILabel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointerArray = [pointerZero, pointerOne, pointerTwo, pointerThree, pointerFour, pointerFive]
        itemArray = [itemOne, itemTwo, itemThree, itemFour, itemFive]
        stack = Stack()
        pointerArray?[0].image = UIImage(systemName: "hand.point.right")
        for i in 0..<itemArray!.count {
            itemArray![i].text = stack!.display()[i]
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
                self.stack?.push(textField!.text!)
                self.display()
                self.increasePointer()
            }
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func popButton(_ sender: Any) {
        stack?.pop()
        display()
        decreasePointer()
    }
    
    func display() {
        let array = stack!.display()
        for i in 0..<array.count {
            itemArray![i].text = array[i]
        }
    }
    
    func increasePointer() {
        var count = 0
        var end = false
        while end == false && count < pointerArray!.count - 1 {
            if pointerArray![count].image != nil {
                pointerArray![count].image = nil
                pointerArray![count + 1].image = UIImage(systemName: "hand.point.right")
                end = true
            }
            count += 1
        }
    }
    
    func decreasePointer() {
        var count = pointerArray!.count - 1
        var end = false
        while end == false && count > 0 {
            if pointerArray![count].image != nil {
                pointerArray![count].image = nil
                pointerArray![count - 1].image = UIImage(systemName: "hand.point.right")
                end = true
            }
            count -= 1
        }
    }
    
}

