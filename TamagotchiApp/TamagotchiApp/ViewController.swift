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

    override func viewDidLoad() {
        super.viewDidLoad()
        tamagotchi = Tamagotchi()
        ageTimer = 30
        mealTimer = 20
        playTimer = 10
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
    
    @IBAction func shrink(_ sender: Any) {
        tamagotchi?.shrink()
        display()
    }
    
    @IBAction func rules(_ sender: Any) {
        let alertController = UIAlertController(title: "Rules", message:
            "Get your tamagotchi as old as you can while making sure:\n\n0 < Weight < 10\n0 < Height < 10\nHappy > 0\nHungry < 10\n Ill < 10\nDirty < 10", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default))

        self.present(alertController, animated: true, completion: nil)
    }
    
    func display() {
        tamagotchiStatistics.text = tamagotchi?.displayStats()
        if tamagotchi?.getHealth() == true {
            tamagotchiStatistics.text = "Your Tamagotchi Died\nDue To \(tamagotchi?.getCauseOfDeath() ?? "Mysterious Causes")"
            tamagotchiImage.image = UIImage(named: "deadTamagotchi.png")
            timer?.invalidate()
        }
    }
    
    @objc func countdown() {
        if ageTimer > 0 {
            ageTimer -= 1
        } else {
            tamagotchi?.growUp()
            ageTimer = Int.random(in: 10...30)
            display()
        }
        if mealTimer > 0 {
            mealTimer -= 1
        } else {
            if tamagotchi?.getHungry() ?? 10 > 5 {
                let alertController = UIAlertController(title: "Your Tamagotchi", message:
                    "I'm Hungry", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Okay", style: .default))
                self.present(alertController, animated: true, completion: nil)
                
                tamagotchiImage.image = UIImage(named: "sadTamagotchi.png")
            } else {
                tamagotchi?.increaseHungry()
                tamagotchiImage.image = UIImage(named: "happyTamagotchi.png")
            }
            mealTimer = Int.random(in: 10...30)
        }
        if playTimer > 0 {
            playTimer -= 1
        } else {
            if tamagotchi?.getHappy() ?? 10 < 5 {
                let alertController = UIAlertController(title: "Your Tamagotchi", message:
                    "Let's Play Something", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Okay", style: .default))
                self.present(alertController, animated: true, completion: nil)
                
                tamagotchiImage.image = UIImage(named: "sadTamagotchi.png")
            } else {
                tamagotchi?.decreaseHappy()
                tamagotchiImage.image = UIImage(named: "happyTamagotchi.png")
            }
            playTimer = Int.random(in: 10...30)
        }
    }
    
}
