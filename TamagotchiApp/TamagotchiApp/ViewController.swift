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

    override func viewDidLoad() {
        super.viewDidLoad()
        tamagotchi = Tamagotchi()
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
    
    @IBAction func growUp(_ sender: Any) {
        tamagotchi?.growUp()
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
            "Get you tamagotchi as old as you can. It can only age when it's: happy, fed, well and clean. If you try to age it when it's not any of these things, it'll die. If it goes overweight (over 10kg) or gets too skinny (over 10 inches), then he'll die. You might also kill it by giving it medication, but that's the only way to make it healthy; it's your call!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default))

        self.present(alertController, animated: true, completion: nil)
    }
    
    func display() {
        tamagotchiStatistics.text = tamagotchi?.displayStats()
        if tamagotchi?.getHealth() == true {
            tamagotchiStatistics.text = "Your Tamagotchi Died"
        }
    }
    
}
