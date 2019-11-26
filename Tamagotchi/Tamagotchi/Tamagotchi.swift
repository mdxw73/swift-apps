//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Obied, Zack (NA) on 21/11/2019.
//  Copyright © 2019 Obied, Zack (NA). All rights reserved.
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
    
    //Counters
    private var mealCount = 0
    private var playCount = 0
    
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
    
    func getName() -> String {
        return self.name
    }
    
    func getGender() -> String {
        return self.gender
    }
    
    func getAge() -> Int {
        return self.age
    }
    
    func getWeight() -> Int {
        return self.weight
    }
    
    func getHeight() -> Double {
        return self.height
    }
    
    func getHappiness() -> Bool {
        return self.happiness
    }
    
    func getHunger() -> Bool {
        return self.hunger
    }
    
    func getFatigue() -> Bool {
        return self.fatigue
    }
    
    func getIllness() -> Bool {
        return self.illness
    }
    
    func getEverything() -> [String] {
        let everything = ["name: \(self.name)", "gender: \(self.gender)", "age: \(self.age)", "weight: \(self.weight)kg", "height: \(self.height)m", "happiness: \(self.happiness)", "hunger: \(self.hunger)", "fatigue: \(self.fatigue)", "illness: \(self.illness)"]
        return everything
    }
    
    func eat() {
        self.hunger = false
        mealCount += 1
        if mealCount > 3 {
            self.happiness = false
            self.weight += 5
            self.height += 0.2
            self.illness = true
            mealCount = 0
            print("I think I've eaten too much.\n")
        } else {
            print("Yum, that was delicious.\n")
        }
        let number = Int.random(in: 1...5)
        if number == 1 {
            self.hunger = true
        }
    }
    
    func play() {
        self.happiness = true
        playCount += 1
        if playCount > 3 {
            self.happiness = false
            self.weight -= 5
            self.height -= 0.2
            self.fatigue = true
            playCount = 0
            print("Can we stop now?\n")
        } else {
            print("Thanks for playing with me.\n")
        }
        let number = Int.random(in: 1...5)
        if number == 1 {
            self.happiness = false
        }
    }
    
    func heal() {
        self.illness = false
        self.happiness = true
        print("Thanks, I feel much better.\n")
        let number = Int.random(in: 1...5)
        if number == 1 {
            self.illness = true
        }
    }
    
    func mature() -> Bool {
        self.age += 1
        print("That is truly fascinating.\n")
        var isDead = false
        if age > 10 {
            print("\(name) died.")
            isDead = true
        }
        return isDead
    }
}
