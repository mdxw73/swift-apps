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
    private var height: Double
    private var happiness: Bool
    private var hunger: Bool
    private var fatigue: Bool
    private var illness: Bool
    
    init() {
        name = "Tammy"
        gender = "Female"
        age = 0
        weight = 10
        height = 1.0
        happiness = true
        hunger = true
        fatigue = false
        illness = false
    }
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
        age = 0
        weight = 10
        height = 1.0
        happiness = true
        hunger = true
        fatigue = false
        illness = false
    }
    
    func getEverything() {
        print("""
            Name: \(name)
            Gender: \(gender)
            Age: \(age)
            Weight: \(weight)
            Height: \(height)
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
            self.height += 0.2
            self.illness = true
            print("I think I've eaten too much.\n")
        } else {
            self.hunger = false
            print("Yum, that was delicious.\n")
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
            self.height -= 0.2
            self.fatigue = true
            print("Can we stop now?\n")
        } else {
            self.happiness = true
            print("Thanks for playing with me.\n")
        }
        let number = Int.random(in: 1...5)
        if number == 1 {
            self.fatigue = true
        }
    }
    
    func heal() {
        self.illness = false
        print("Thanks, I feel much better.\n")
        let number = Int.random(in: 1...5)
        if number == 1 {
            self.happiness = false
        }
    }
    
    func sleep() {
        self.fatigue = false
        print("Thanks, I feel much better.\n")
        let number = Int.random(in: 1...5)
        if number == 1 {
            self.hunger = true
        }
    }
    
    func mature() -> Bool {
        if self.happiness == true && hunger == false && fatigue == false && illness == false {
            self.age += 1
            print("That is truly fascinating.\n")
            self.happiness = false
            self.hunger = true
            self.fatigue = true
            self.illness = true
        } else {
            print("I don't feel like learning.\n")
        }
        var isDead = false
        let number = Int.random(in: 1...10)
        if number == 1 {
            isDead = true
            print("\(self.name) died.")
        }
        return isDead
    }
}
