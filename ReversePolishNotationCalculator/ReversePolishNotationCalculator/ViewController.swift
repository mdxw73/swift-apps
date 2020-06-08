//
//  ViewController.swift
//  ReversePolishNotationCalculator
//
//  Created by Zack Obied on 08/06/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var expression: String = "" {
        didSet {
            display.text = expression
        }
    }
    var calculator: Calculator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.display.text = ""
        calculator = Calculator()
    }

    @IBAction func help(_ sender: Any) {
        let alert = UIAlertController(title: "Help", message: "The inputs must conform to reverse polish notation. If multiple numbers are entered and insufficient operations are provided, the system will perform the relevant operations on the most recent operands.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func one(_ sender: Any) {
        let valid = checkDigitsLength()
        if valid == true {
            self.expression += "1"
        }
    }
    @IBAction func two(_ sender: Any) {
        let valid = checkDigitsLength()
        if valid == true {
            self.expression += "2"
        }
    }
    @IBAction func three(_ sender: Any) {
        let valid = checkDigitsLength()
        if valid == true {
            self.expression += "3"
        }
    }
    @IBAction func four(_ sender: Any) {
        let valid = checkDigitsLength()
        if valid == true {
            self.expression += "4"
        }
    }
    @IBAction func five(_ sender: Any) {
        let valid = checkDigitsLength()
        if valid == true {
            self.expression += "5"
        }
    }
    @IBAction func six(_ sender: Any) {
        let valid = checkDigitsLength()
        if valid == true {
            self.expression += "6"
        }
    }
    @IBAction func seven(_ sender: Any) {
        let valid = checkDigitsLength()
        if valid == true {
            self.expression += "7"
        }
    }
    @IBAction func eight(_ sender: Any) {
        let valid = checkDigitsLength()
        if valid == true {
            self.expression += "8"
        }
    }
    @IBAction func nine(_ sender: Any) {
        let valid = checkDigitsLength()
        if valid == true {
            self.expression += "9"
        }
    }
    @IBAction func zero(_ sender: Any) {
        let valid = checkDigitsLength()
        if valid == true {
            self.expression += "0"
        }
    }
    @IBAction func evaluate(_ sender: Any) {
        checkFormat()
        if self.expression.count > 0 && self.expression.last != " " { //Checking again for a space ensures the change sign operator isn't still active
            self.expression = String(calculator!.evaluate(expression: self.expression))
        }
    }
    @IBAction func clear(_ sender: Any) {
        self.expression = ""
    }
    @IBAction func enter(_ sender: Any) {
        checkFormat()
        if self.expression.last != " " {
            self.expression += " "
        }
    }
    @IBAction func changeSign(_ sender: Any) {
        if self.expression.last == "-" {
            self.expression.removeLast()
        } else if self.expression.count == 0 {
            self.expression.append("-")
        } else if let _ = Int(String(self.expression.last!)) {
        } else {
            self.expression.append("-")
        }
    }
    @IBAction func add(_ sender: Any) {
        checkFormat()
        let valid = checkSignsLength()
        if valid == true {
            self.expression += " + "
        } else {
               self.expression += " "
           }
    }
    @IBAction func subtract(_ sender: Any) {
        checkFormat()
        let valid = checkSignsLength()
        if valid == true {
            self.expression += " - "
        } else {
               self.expression += " "
           }
    }
    @IBAction func multiply(_ sender: Any) {
        checkFormat()
        let valid = checkSignsLength()
        if valid == true {
            self.expression += " * "
        } else {
               self.expression += " "
           }
    }
    @IBAction func divide(_ sender: Any) {
        checkFormat()
        let valid = checkSignsLength()
        if valid == true {
            self.expression += " / "
        } else {
            self.expression += " "
        }
    }
    
    func checkFormat() {
        if self.expression.last == " " || self.expression.last == "-" {
            self.expression.removeLast()
        }
    }
    
    func checkDigitsLength() -> Bool {
        if self.expression.count > 0 {
            if self.expression.components(separatedBy: " ").last!.count > 2 {
                return false
            } else {
                return true
            }
        }
        return true
    }
    
    func checkSignsLength() -> Bool {
        if self.expression.count > 0 {
            let parts = self.expression.components(separatedBy: " ")
            if parts.count > 1 {
                if let _ = Int(parts[parts.count-1]) {
                    return true
                } else if let _ = Int(parts[parts.count-2]) {
                    if parts.count > 4 {
                        return true
                    }
                } else {
                    return false
                }
            }
        }
        return false
    }
    
}

