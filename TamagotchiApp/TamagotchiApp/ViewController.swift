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

    @IBAction func feed(_ sender: Any) {
        tamagotchi?.eat()
        display()
    }
    
    @IBAction func play(_ sender: Any) {
        tamagotchi?.play()
        display()
    }
    
    @IBAction func heal(_ sender: Any) {
        tamagotchi?.heal()
        display()
    }
    
    @IBAction func sleep(_ sender: Any) {
        tamagotchi?.sleep()
        display()
    }
    
    @IBAction func mature(_ sender: Any) {
        tamagotchi?.mature()
        display()
    }
    
    func display() {
        tamagotchiStatistics.text = tamagotchi?.displayStats()
    }
    
}
