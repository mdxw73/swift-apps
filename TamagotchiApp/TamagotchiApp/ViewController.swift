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
    
    func display() {
        tamagotchiStatistics.text = tamagotchi?.displayStats()
        if tamagotchi?.getHealth() == true {
            tamagotchiStatistics.text = "Your Tamagotchi Died"
        }
    }
    
}
