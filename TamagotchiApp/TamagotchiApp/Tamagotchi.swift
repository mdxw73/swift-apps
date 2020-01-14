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
    private var happy: Bool
    private var hungry: Bool
    private var ill: Bool
    private var dirty: Bool
    private var dead: Bool
    
    init() {
        name = "Tammy"
        age = 0
        weight = 1
        height = 1
        happy = true
        hungry = true
        ill = false
        dirty = false
        dead = false
    }
    
    func displayStats() -> String {
        return ("""
            Name: \(name)
            Age: \(age)
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
    
    func feedMeal() {
        if self.height < 10 && self.weight < 10 {
            self.hungry = false
            self.weight += 2
            self.height += 1
        } else {
            self.dead = true
        }
    }
    
    func feedSnack() {
        if self.height < 10 && self.weight < 10 {
            self.hungry = false
            self.weight += 1
            if Int.random(in: 1...5) == 1 {
                self.ill = true
            }
        } else {
            self.dead = true
        }
    }
    
    func playGame() {
        if self.weight > 1 && height > 1 {
            self.happy = true
            self.weight -= 1
            self.height -= 1
            if Int.random(in: 1...5) == 1 {
                self.dirty = true
            }
        }
    }
    
    func growUp() {
        if self.happy == true && self.hungry == false && self.ill == false && self.dirty == false {
            self.age += 1
            self.happy = false
            self.hungry = true
            self.ill = true
            self.dirty = true
        } else {
            self.dead = true
        }
    }
    
    func cleanUp() {
        self.dirty = false
        if Int.random(in: 1...5) == 1 {
            self.hungry = true
        }
    }
    
    func medicate() {
        if Int.random(in: 1...5) == 1 {
            self.dead = true
        } else {
            self.ill = false
            self.happy = false
        }
    }
    
}
