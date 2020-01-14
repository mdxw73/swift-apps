//
//  Tamagotchi.swift
//  TamagotchiApp
//
//  Created by Obied, Zack (NA) on 14/01/2020.
//  Copyright © 2020 Obied, Zack (NA). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    //Properties
    private var name: String
    private var gender: String
    private var age: Int
    private var weight: Int
    private var height: Int
    private var happiness: Bool
    private var hunger: Bool
    private var fatigue: Bool
    private var illness: Bool
    
    init() {
        name = "Tammy"
        gender = "Female"
        age = 0
        weight = 10
        height = 1
        happiness = true
        hunger = true
        fatigue = false
        illness = false
    }
    
    func displayStats() -> String {
        return ("""
            Name: \(name)
            Gender: \(gender)
            Age: \(age)
            Weight: \(weight)kg
            Height: \(height)ft
            Happiness: \(happiness)
            Hunger: \(hunger)
            Fatigue: \(fatigue)
            Illness: \(illness)
            """)
    }
    
    func eat() {
        if self.hunger == false {
            self.happiness = false
            self.weight += 5
            self.height += 1
            self.illness = true
        } else {
            self.hunger = false
        }
        let number = Int.random(in: 1...5)
        if number == 1 {
            self.illness = true
        }
    }
    
    func play() {
        if self.happiness == true {
            self.happiness = false
            self.weight -= 5
            if height < 1 {
                self.height -= 1
            }
            self.fatigue = true
        } else {
            self.happiness = true
        }
        let number = Int.random(in: 1...5)
        if number == 1 {
            self.fatigue = true
        }
    }
    
    func heal() {
        self.illness = false
        let number = Int.random(in: 1...5)
        if number == 1 {
            self.happiness = false
        }
    }
    
    func sleep() {
        self.fatigue = false
        let number = Int.random(in: 1...5)
        if number == 1 {
            self.hunger = true
        }
    }
    
    func mature() {
        if self.happiness == true && hunger == false && fatigue == false && illness == false {
            self.age += 1
            self.happiness = false
            self.hunger = true
            self.fatigue = true
            self.illness = true
        }
    }
    
}
