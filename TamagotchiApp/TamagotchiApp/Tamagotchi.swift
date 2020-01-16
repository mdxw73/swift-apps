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
    private var age: Int
    private var weight: Int
    private var height: Int
    private var happy: Int
    private var hungry: Int
    private var ill: Bool
    private var dirty: Bool
    private var dead: Bool
    
    private var mealCount: Int = 3
    
    init() {
        name = "Tammy"
        age = 0
        weight = 5
        height = 5
        happy = 5
        hungry = 5
        ill = false
        dirty = false
        dead = false
    }
    
    func displayStats() -> String {
        return ("""
            Name: \(name)
            Age: \(age) days
            Weight: \(weight)kg
            Height: \(height)"
            Happy: \(happy)
            Hungry: \(hungry)
            Ill: \(ill)
            Dirty: \(dirty)
            """)
    }
    
    func getHealth() -> Bool {
        return self.dead
    }
    
    func getWeight() -> Int {
        return self.weight
    }
    
    func feedMeal() {
        if mealCount > 0 && self.hungry > 2 {
            self.hungry -= 3
            mealCount -= 1
            if Int.random(in: 1...5) == 1 {
                self.ill = true
            }
        } else {
            if self.weight < 18 {
                self.weight += 3
            } else {
                self.dead = true
            }
            if happy > 4 {
                self.happy -= 5
            }
            mealCount = 3
        }
    }
    
    func feedSnack() {
        if mealCount > 0 && self.hungry > 0 {
            self.hungry -= 1
            mealCount -= 1
            if Int.random(in: 1...5) == 1 {
                self.ill = true
            }
        } else {
            if weight < 18 {
                self.weight += 1
            } else {
                self.dead = true
            }
            if happy > 4 {
                self.happy -= 5
            }
            mealCount = 3
        }
    }
    
    func playGame() {
        if self.weight > 1 && happy < 9 {
            self.happy += 2
            if self.weight > 1 {}
            self.weight -= 1
            if Int.random(in: 1...5) == 1 {
                self.dirty = true
            }
        } else {
            self.ill = true
        }
    }
    
    func growUp() {
        self.age += 1
        self.height += 1
        if Int.random(in: 1...5) == 1 && age > 10 {
            self.dead = true
        }
    }
    
    func cleanUp() {
        self.dirty = false
        if Int.random(in: 1...5) == 1 {
            if hungry < 6{
                self.hungry += 5
            }
        }
    }
    
    func medicate() {
        self.ill = false
        if Int.random(in: 1...5) == 1 {
            self.dead = true
        }
    }
    
}
