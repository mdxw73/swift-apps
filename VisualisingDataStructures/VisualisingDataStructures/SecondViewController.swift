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
    @IBOutlet var pointerZero: UIImageView!
    @IBOutlet var pointerOne: UIImageView!
    @IBOutlet var pointerTwo: UIImageView!
    @IBOutlet var pointerThree: UIImageView!
    @IBOutlet var pointerFour: UIImageView!
    @IBOutlet var pointerFive: UIImageView!
    
    var stack: Stack?
    var pointerArray: [UIImageView]?
    var itemArray: [UILabel]?
    var currentPointer = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Push", message: "Enter an item", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.text = ""
        }
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alertController] (_) in
            let textField = alertController?.textFields![0]
            if textField!.text!.count < 20 && textField!.text!.count > 0 {
                if self.currentPointer < self.pointerArray!.count - 1 {
                    self.stack?.push(textField!.text!)
                    self.currentPointer += 1
                    self.pointerArray?[self.currentPointer - 1].image = nil
                    self.pointerArray?[self.currentPointer].image = UIImage(systemName: "hand.point.right")
                    self.itemArray?[self.currentPointer - 1].text = self.stack?.peek()
                }
            }
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func popButton(_ sender: Any) {
        stack?.pop()
        if self.currentPointer > 0 {
            self.currentPointer -= 1
            self.pointerArray?[self.currentPointer + 1].image = nil
            self.pointerArray?[self.currentPointer].image = UIImage(systemName: "hand.point.right")
        }
    }

}
