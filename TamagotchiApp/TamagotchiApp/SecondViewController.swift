//
//  SecondViewController.swift
//  TamagotchiApp
//
//  Created by Zack Obied on 25/01/2020.
//  Copyright © 2020 Obied, Zack (NA). All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var label: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var switchOne: UISwitch!
    @IBOutlet var switchTwo: UISwitch!
    @IBOutlet var switchThree: UISwitch!
    @IBOutlet var switchFour: UISwitch!
    @IBOutlet var switchFive: UISwitch!
    @IBOutlet var switchSix: UISwitch!
    @IBOutlet var switchSeven: UISwitch!
    @IBOutlet var switchEight: UISwitch!
    @IBOutlet var switchNine: UISwitch!
    @IBOutlet var switchTen: UISwitch!
    @IBOutlet var switchEleven: UISwitch!
    @IBOutlet var switchTwelve: UISwitch!
    
    var timer: Timer?
    var switchArray: [UISwitch] = []
    var timerInvalid: Bool = false
    var timeInterval: Double = 2.0
    var randomiserLimit: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchArray = [switchOne, switchTwo, switchThree, switchFour, switchFive, switchSix, switchSeven, switchEight, switchNine, switchTen, switchEleven, switchTwelve]
        image.image = UIImage(named: "happyTamagotchi")
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    @IBAction func retry(_ sender: Any) {
        for i in 0...11 {
            switchArray[i].isEnabled = true
            switchArray[i].setOn(true, animated: true)
        }
        progressBar.progress = 0
        label.text = "Wack The Switch"
        image.image = UIImage(named: "happyTamagotchi")
        timerInvalid = false
        timeInterval = 2.0
        randomiserLimit = 10
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    @IBAction func rules(_ sender: Any) {
        let alert = UIAlertController(title: "Rules", message:
            "Keep the switches on to make your tamagotchi happy. If more than three switches are turned off he gets sad and if more than seven switches are turned off, he dies. Get the progress bar to the end to win!\n\nAs always, it gets harder as you go!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (_) in
            self.timer = Timer.scheduledTimer(timeInterval: self.timeInterval, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
            }))
        self.present(alert, animated: true, completion: nil)
        timer?.invalidate()
    }
    
    func disableSwitches() {
        for i in 0...11 {
            switchArray[i].isEnabled = false
        }
    }
    
    @objc func countdown() {
        if timerInvalid == false {
            for i in 0...11 {
                if Int.random(in: 1...randomiserLimit) == 1 {
                    switchArray[i].setOn(false, animated: true)
                }
            }
            var count = 0
            for element in switchArray {
                if element.isOn {
                    count += 1
                }
            }
            if count > 9 {
                image.image = UIImage(named: "happyTamagotchi")
                progressBar.progress += 0.01
            } else if count > 5 {
                image.image = UIImage(named: "sadTamagotchi")
            } else {
                image.image = UIImage(named: "deadTamagotchi")
                label.text = "You Lose"
                timerInvalid = true
                disableSwitches()
            }
            if progressBar.progress >= 1.0 {
                label.text = "You Win"
                image.image = UIImage(named: "happyTamagotchi")
                timerInvalid = true
                disableSwitches()
            } else if progressBar.progress >= 0.8 {
                timeInterval = 0.6
                randomiserLimit = 6
            } else if progressBar.progress >= 0.6 {
                timeInterval = 0.8
                randomiserLimit = 7
            } else if progressBar.progress >= 0.4 {
                timeInterval = 1.0
                randomiserLimit = 8
            } else if progressBar.progress >= 0.2 {
                timeInterval = 1.4
                randomiserLimit = 9
            }
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        } else {
            timer?.invalidate()
        }
    }

}
