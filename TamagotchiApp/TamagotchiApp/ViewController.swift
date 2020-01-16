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
    
    var tamagotchi: Tamagotchi? {
        didSet {
            tamagotchiStatistics.text = tamagotchi?.displayStats()
        }
    }
    var timer: Timer?
    var ageTimer = 0
    var mealTimer = 0
    var playTimer = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tamagotchi = Tamagotchi()
        ageTimer = 90
        mealTimer = 60
        playTimer = 30
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    @IBAction func feedMeal(_ sender: Any) {
        tamagotchi?.feedMeal()
        display()
    }
    
    @IBAction func feedSnack(_ sender: Any) {
        tamagotchi?.feedSnack()
        display()
    }
    
    @IBAction func playGame(_ sender: Any) {
        tamagotchi?.playGame()
        display()
    }
    
    @IBAction func cleanUp(_ sender: Any) {
        tamagotchi?.cleanUp()
        display()
    }
    
    @IBAction func medicate(_ sender: Any) {
        tamagotchi?.medicate()
        display()
    }
    
    @IBAction func rules(_ sender: Any) {
        let alertController = UIAlertController(title: "Rules", message:
            "Get your tamagotchi as old as you can. It can only age when it's: happy, fed, well and clean. If you try to age it when it's not any of these things, it'll die. If it goes overweight (over 10kg) or gets too skinny (over 10 inches), then he'll die. You might also kill it by giving it medication, but that's the only way to make it healthy; it's your call!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default))

        self.present(alertController, animated: true, completion: nil)
    }
    
    func display() {
        tamagotchiStatistics.text = tamagotchi?.displayStats()
        if tamagotchi?.getHealth() == true {
            tamagotchiStatistics.text = "Your Tamagotchi Died"
        }
    }
    
    @objc func countdown() {
        if ageTimer > 0 {
            ageTimer -= 1
        } else {
            tamagotchi?.growUp()
            playTimer = Int.random(in: 30...100)
            display()
        }
        if mealTimer > 0 {
            mealTimer -= 1
        } else {
            let alertController = UIAlertController(title: "Your Tamagotchi", message:
                "I'm Hungry", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default))

            self.present(alertController, animated: true, completion: nil)
            playTimer = Int.random(in: 30...100)
        }
        if playTimer > 0 {
            playTimer -= 1
        } else {
            let alertController = UIAlertController(title: "Your Tamagotchi", message:
                "Let's Play Something", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default))

            self.present(alertController, animated: true, completion: nil)
            playTimer = Int.random(in: 30...100)
        }
    }
    
}
