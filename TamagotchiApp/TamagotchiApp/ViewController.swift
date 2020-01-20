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
    @IBOutlet var scoreDisplay: UILabel!
    @IBOutlet var stateDisplay: UILabel!
    
    var tamagotchi: Tamagotchi? {
        didSet {
            tamagotchiStatistics.text = tamagotchi?.displayStats()
            tamagotchiImage.image = UIImage(named: "happyTamagotchi.png")
        }
    }
    var timer: Timer?
    var ageTimer = 0
    var mealTimer = 0
    var playTimer = 0
    var timerInvalid = false
    var randomiserLimit = 30
    var score = 0 {
        didSet {
            scoreDisplay.text = "Score: \(score)"
        }
    }
    var state = "" {
        didSet {
            stateDisplay.text = state
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tamagotchi = Tamagotchi()
        ageTimer = 30
        mealTimer = 20
        playTimer = 10
        score = 0
        state = "Hello"
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    @IBAction func feedMeal(_ sender: Any) {
        tamagotchi?.feedMeal()
        score += 100
        display()
    }
    
    @IBAction func feedSnack(_ sender: Any) {
        tamagotchi?.feedSnack()
        score += 100
        display()
    }
    
    @IBAction func playGame(_ sender: Any) {
        tamagotchi?.playGame()
        score += 100
        display()
    }
    
    @IBAction func cleanUp(_ sender: Any) {
        tamagotchi?.cleanUp()
        score += 100
        display()
    }
    
    @IBAction func medicate(_ sender: Any) {
        tamagotchi?.medicate()
        score += 100
        display()
    }
    
    @IBAction func shrink(_ sender: Any) {
        tamagotchi?.shrink()
        score += 100
        display()
    }
    
    @IBAction func rules(_ sender: Any) {
        let alertController = UIAlertController(title: "Rules", message:
            "Get 100,000 Points before your tamagotchi dies:\n\n0 < Weight < 10\n0 < Height < 10\nHappy > 0\nHungry < 10\n Ill < 10\nDirty < 10\n\nSurvive 50 days to win!\nCareful: it gets harder as you go!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default))
        self.present(alertController, animated: true, completion: nil)
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
            tamagotchiImage.image = UIImage(named: "deadTamagotchi.png")
            feedMealButton.isEnabled = false
            feedSnackButton.isEnabled = false
            playGameButton.isEnabled = false
            cleanUpButton.isEnabled = false
            medicateButton.isEnabled = false
            shrinkButton.isEnabled = false
            timerInvalid = true
            state = ""
            timer?.invalidate()
        } else if score >= 100000 {
            tamagotchiStatistics.text = "You Win!\nYou Scored Over 100,000 Points!\n\nYour Tamagotchi Will Live Forever"
            tamagotchiImage.image = UIImage(named: "happyTamagotchi.png")
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
            randomiserLimit = 30
        } else if tamagotchi?.getAge() ?? 0 < 20 {
            randomiserLimit = 25
        } else if tamagotchi?.getAge() ?? 0 < 30 {
            randomiserLimit = 20
        } else if tamagotchi?.getAge() ?? 0 < 40 {
            randomiserLimit = 15
        } else {
            randomiserLimit = 10
        }
        //Timer decrements and resets
        if ageTimer > 0 {
            ageTimer -= 1
            score += 10
        } else if timerInvalid == false {
            tamagotchi?.growUp()
            score += 1000
            ageTimer = Int.random(in: 5...randomiserLimit)
        }
        if mealTimer > 0 {
            mealTimer -= 1
            score += 10
        } else if timerInvalid == false {
            if tamagotchi?.getHungry() ?? 5 > 5 {
                score -= 100
                state = "I'm Hungry"
                tamagotchiImage.image = UIImage(named: "sadTamagotchi.png")
            } else {
                tamagotchi?.increaseHungry()
                score += 100
            }
            mealTimer = Int.random(in: 5...randomiserLimit)
        }
        if playTimer > 0 {
            playTimer -= 1
            score += 10
        } else if timerInvalid == false {
            if tamagotchi?.getHappy() ?? 5 < 5 {
                score -= 100
                state = "I'm Bored"
                tamagotchiImage.image = UIImage(named: "sadTamagotchi.png")
            } else {
                tamagotchi?.decreaseHappy()
                score += 100
            }
            playTimer = Int.random(in: 5...randomiserLimit)
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
        tamagotchiImage.image = UIImage(named: "happyTamagotchi.png")
        ageTimer = 30
        mealTimer = 20
        playTimer = 10
        timerInvalid = false
        randomiserLimit = 30
        score = 0
        state = "Hello"
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
}
