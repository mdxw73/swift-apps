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
    private var illness: Bool
    private var dirty: Bool
    private var dead: Bool
    
    init() {
        name = "Tammy"
        gender = "Female"
        age = 0
        weight = 10
        height = 3
        happiness = true
        hunger = true
        illness = false
        dirty = false
        dead = false
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
            Illness: \(illness)
            Dirty: \(dirty)
            """)
    }
    
    func getHealth() -> Bool {
        return self.dead
    }
    
    func feedMeal() {
        if self.height < 10 {
            self.hunger = false
            self.height += 1
            if Int.random(in: 1...5) == 1 {
                self.illness = true
            }
        }
    }
    
    func feedSnack() {
        if self.weight < 20 {
            self.hunger = false
            self.weight += 1
            if Int.random(in: 1...5) == 1 {
                self.illness = true
            }
        }
    }
    
    func playGame() {
        if self.weight > 1 && height > 1 {
            self.happiness = true
            self.weight -= 1
            self.height -= 1
            if Int.random(in: 1...5) == 1 {
                self.dirty = true
            }
        }
    }
    
    func growUp() {
        self.age += 1
        if Int.random(in: 1...5) == 1 {
            self.hunger = true
        }
        if self.age > 10 {
            if Int.random(in: 1...5) == 1 {
                self.dead = true
            }
        }
    }
    
    func cleanUp() {
        self.dirty = false
        if Int.random(in: 1...5) == 1 {
            self.happiness = false
        }
    }
    
    func medicate() {
        if Int.random(in: 1...5) == 1 {
            self.dead = true
        } else {
            self.illness = false
        }
    }
    
}
