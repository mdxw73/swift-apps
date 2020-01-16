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
    private var name: String = "Tammy"
    private var age: Int = 0
    private var weight: Int = 5
    private var height: Int = 5
    private var happy: Int = 5
    private var hungry: Int = 5
    private var ill: Int = 1
    private var dirty: Int = 1
    private var dead: Bool = false
    private var causeOfDeath: String = ""
    
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
    
    func getHungry() -> Int {
        return self.hungry
    }
    
    func getHappy() -> Int {
        return self.happy
    }
    
    func getAge() -> Int {
        return self.age
    }
    
    func getHealth() -> Bool {
        return self.dead
    }
    
    func getCauseOfDeath() -> String {
        return self.causeOfDeath
    }
    
    func feedMeal() {
        if self.hungry > 2 {
            self.hungry -= 2
        }
        self.weight += 2
        if Int.random(in: 1...5) == 1 {
            self.ill += 2
        }
        checkStats()
    }
    
    func feedSnack() {
        if self.hungry > 1 {
            self.hungry -= 1
        }
        self.weight += 1
        if Int.random(in: 1...5) == 1 {
            self.happy -= 2
        }
        checkStats()
    }
    
    func playGame() {
        if self.happy < 9 {
            self.happy += 1
        }
        self.weight -= 1
        if Int.random(in: 1...5) == 1 {
            self.dirty += 2
        }
        checkStats()
    }
    
    func cleanUp() {
        if dirty > 1 {
            self.dirty -= 1
        }
        if Int.random(in: 1...5) == 1 {
            self.hungry += 2
        }
        checkStats()
    }
    
    func medicate() {
        if self.ill > 1 {
            self.ill -= 1
        }
        if Int.random(in: 1...5) == 1 {
            self.happy -= 2
        }
        checkStats()
    }
    
    func shrink() {
        self.height -= 1
        if Int.random(in: 1...5) == 1 {
            self.ill += 2
        }
        checkStats()
    }
    
    func growUp() {
        self.age += 1
        self.height += 1
        if Int.random(in: 1...5) == 1 {
            self.hungry += 2
        }
        checkStats()
    }
    
    func increaseHungry() {
        self.hungry += 3
    }
    
    func decreaseHappy() {
        self.happy -= 3
    }
    
    func checkStats() {
        if Int.random(in: 1...5) == 1 && age > 10 {
            self.dead = true
            self.causeOfDeath = "Old Age"
        } else if weight > 9 {
            self.dead = true
            self.causeOfDeath = "Obesity"
        } else if weight < 1 {
            self.dead = true
            self.causeOfDeath = "Anorexia"
        } else if height > 9 {
            self.dead = true
            self.causeOfDeath = "Neglect" //Height increases over time, so you must shrink him
        } else if height < 1 {
            self.dead = true
            self.causeOfDeath = "Dwarfism"
        } else if self.happy < 1 {
            self.dead = true
            self.causeOfDeath = "Suicide"
        } else if self.hungry > 9 {
            self.dead = true
            self.causeOfDeath = "Starvation"
        } else if self.ill > 9 {
            self.dead = true
            self.causeOfDeath = "Illness"
        } else if self.dirty > 9 {
            self.dead = true
            self.causeOfDeath = "Infection"
        }
    }
    
    func resetGame() {
        self.age = 0
        self.weight = 5
        self.height = 5
        self.happy = 5
        self.hungry = 5
        self.ill = 1
        self.dirty = 1
        self.dead = false
    }
    
}
