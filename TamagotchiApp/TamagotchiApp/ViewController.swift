//
//  ViewController.swift
//  TamagotchiApp
//
//  Created by Obied, Zack (NA) on 14/01/2020.
//  Copyright © 2020 Obied, Zack (NA). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tamagotchiStatistics: UILabel!
    @IBOutlet var tamagotchiImage: UIImageView!
    @IBOutlet var feedMealButton: UIButton!
    @IBOutlet var feedSnackButton: UIButton!
    @IBOutlet var playGameButton: UIButton!
    @IBOutlet var cleanUpButton: UIButton!
    @IBOutlet var medicateButton: UIButton!
    @IBOutlet var shrinkButton: UIButton!
    @IBOutlet var stateDisplay: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    var tamagotchi: Tamagotchi? {
        didSet {
            tamagotchiStatistics.text = tamagotchi?.displayStats()
            tamagotchiImage.image = UIImage(named: "happyTamagotchi")
            stateDisplay.text = state
        }
    }
    var timer: Timer?
    var ageTimer = 0
    var mealTimer = 0
    var playTimer = 0
    var timerInvalid = false
    var randomiserLimit = 9
    var state = "Hello" {
        didSet {
            stateDisplay.text = state
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tamagotchi = Tamagotchi()
        ageTimer = 10
        mealTimer = 6
        playTimer = 2
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    @IBAction func feedMeal(_ sender: Any) {
        tamagotchi?.feedMeal()
        display()
        if tamagotchi?.getIll() ?? 1 > 5 {
            state = "I Don't Feel Too Good"
            tamagotchiImage.image = UIImage(named: "sadTamagotchi")
        }
    }
    
    @IBAction func feedSnack(_ sender: Any) {
        tamagotchi?.feedSnack()
        display()
    }
    
    @IBAction func playGame(_ sender: Any) {
        tamagotchi?.playGame()
        display()
        if tamagotchi?.getDirty() ?? 1 > 5 {
            state = "I'm Really Dirty"
            tamagotchiImage.image = UIImage(named: "sadTamagotchi")
        }
    }
    
    @IBAction func cleanUp(_ sender: Any) {
        tamagotchi?.cleanUp()
        display()
    }
    
    @IBAction func medicate(_ sender: Any) {
        tamagotchi?.medicate()
        display()
    }
    
    @IBAction func shrink(_ sender: Any) {
        tamagotchi?.shrink()
        display()
    }
    
    @IBAction func rules(_ sender: Any) {
        let alert = UIAlertController(title: "Rules", message:
            "Get your tamagotchi to live as long as you can. Here are the rules:\n\n0 < Weight < 10\n0 < Height < 10\nHappy > 0\nHungry < 10\n Ill < 10\nDirty < 10\n\nSurvive 50 days to win!\nCareful, it gets harder as you go!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func name(_ sender: Any) {
        let alertController = UIAlertController(title: "Name Your Tamagotchi", message: "Enter a name", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.text = "\(self.tamagotchi?.getName() ?? "Tammy")"
        }
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alertController] (_) in
            let textField = alertController?.textFields![0]
            if textField!.text?.count ?? 10 < 10 && textField!.text?.count ?? 0 > 0 {
                self.tamagotchi?.name(textField!.text ?? "Tammy")
                self.display()
            }
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func display() {
        tamagotchiStatistics.text = tamagotchi?.displayStats()
        if tamagotchi?.getHealth() == true {
            var noun = "Days"
            if tamagotchi?.getAge() == 1 {
                noun = "Day"
            }
            tamagotchiStatistics.text = "Your Tamagotchi Died\nDue To \(tamagotchi?.getCauseOfDeath() ?? "Mysterious Causes")\n\nYour Tamagotchi Survived \(tamagotchi?.getAge() ?? 0) \(noun)"
            tamagotchiImage.image = UIImage(named: "deadTamagotchi")
            feedMealButton.isEnabled = false
            feedSnackButton.isEnabled = false
            playGameButton.isEnabled = false
            cleanUpButton.isEnabled = false
            medicateButton.isEnabled = false
            shrinkButton.isEnabled = false
            timerInvalid = true
            state = ""
            timer?.invalidate()
        }
    }
    
    @objc func countdown() {
        //Increases speed as you progress
        if tamagotchi?.getAge() ?? 0 < 10 {
            randomiserLimit = 9
        } else if tamagotchi?.getAge() ?? 0 < 20 {
            randomiserLimit = 8
        } else if tamagotchi?.getAge() ?? 0 < 30 {
            randomiserLimit = 7
        } else if tamagotchi?.getAge() ?? 0 < 40 {
            randomiserLimit = 6
        } else {
            randomiserLimit = 5
        }
        //Timer decrements and resets
        if ageTimer > 0 {
            ageTimer -= 1
        } else if timerInvalid == false {
            tamagotchi?.growUp()
            progressBar.progress += 0.02
            let age = tamagotchi?.getAge() ?? 0
            if age == Int.random(in: age - 2...age + 2) {
                tamagotchi?.increaseIll()
                state = "I Feel Sick"
                tamagotchiImage.image = UIImage(named: "sadTamagotchi")
            }
            ageTimer = 10
        }
        if mealTimer > 0 {
            mealTimer -= 1
        } else if timerInvalid == false {
            if tamagotchi?.getHungry() ?? 5 > 5 {
                state = "I'm Hungry"
                tamagotchiImage.image = UIImage(named: "sadTamagotchi")
            } else {
                tamagotchi?.increaseHungry()
                if tamagotchi?.getHungry() ?? 5 < 5 {
                    state = "I'm Well Fed"
                    tamagotchiImage.image = UIImage(named: "happyTamagotchi")
                } else {
                    state = "I'm Hungry"
                    tamagotchiImage.image = UIImage(named: "sadTamagotchi")
                }
            }
            mealTimer = Int.random(in: 1...randomiserLimit)
        }
        if playTimer > 0 {
            playTimer -= 1
        } else if timerInvalid == false {
            if tamagotchi?.getHappy() ?? 5 < 5 {
                state = "I'm Bored"
                tamagotchiImage.image = UIImage(named: "sadTamagotchi")
            } else {
                tamagotchi?.decreaseHappy()
                if tamagotchi?.getHappy() ?? 5 > 5 {
                    state = "I'm Having Fun"
                    tamagotchiImage.image = UIImage(named: "happyTamagotchi")
                } else {
                    state = "I'm Bored"
                    tamagotchiImage.image = UIImage(named: "sadTamagotchi")
                }
            }
            playTimer = Int.random(in: 1...randomiserLimit)
        }
        display()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        tamagotchi?.resetGame()
        feedMealButton.isEnabled = true
        feedSnackButton.isEnabled = true
        playGameButton.isEnabled = true
        cleanUpButton.isEnabled = true
        medicateButton.isEnabled = true
        shrinkButton.isEnabled = true
        tamagotchiStatistics.text = tamagotchi?.displayStats()
        tamagotchiImage.image = UIImage(named: "happyTamagotchi")
        ageTimer = 10
        mealTimer = 6
        playTimer = 2
        timerInvalid = false
        randomiserLimit = 9
        state = "Hello"
        progressBar.progress = 0.0
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
}
