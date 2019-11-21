//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Obied, Zack (NA) on 21/11/2019.
//  Copyright © 2019 Obied, Zack (NA). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    private var age: Int
    private var name: String
    private var gender: String
    private var weight: Int
    private var height: Int
    private var happiness: Bool
    private var hunger: Bool
    
    init() {
        age = 0
        name = "Tammy"
        gender = "Female"
        weight = 1
        height = 1
        happiness = false
        hunger = true
    }
    
    init(name: String, gender: String) {
        age = 0
        self.name = name
        self.gender = gender
        weight = 1
        height = 1
        happiness = false
        hunger = true
    }
    
    func getEverything() -> [String] {
        let everything = ["age: \(self.age)", "name: \(self.name)", "gender: \(self.gender)", "weight: \(self.weight)", "height: \(self.height)", "happiness: \(self.happiness)", "hunger: \(self.hunger)"]
        return everything
    }
    
}
