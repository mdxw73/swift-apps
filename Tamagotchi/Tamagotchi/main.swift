//
//  main.swift
//  Tamagotchi
//
//  Created by Obied, Zack (NA) on 21/11/2019.
//  Copyright © 2019 Obied, Zack (NA). All rights reserved.
//

import Foundation

func display() {
    let array = tamagotchi.getEverything()
    for i in 2 ..< array.count {
        print(array[i])
    }
    print("")
}

let tamagotchi = Tamagotchi(name: "John", gender: "Male")
let array = tamagotchi.getEverything()

var quit = false
var isDead = false
while quit == false && isDead == false {
    display()
    print(
    """
    Enter a function:
    1. Eat
    2. Play
    3. Heal
    4. Mature
    5. Quit
    """)
    if let input = readLine() {
        if input == "1" {
            tamagotchi.eat()
        } else if input == "2" {
            tamagotchi.play()
        } else if input == "3" {
            tamagotchi.heal()
        } else if input == "4" {
            isDead = tamagotchi.mature()
        } else if input == "5" {
            quit = true
        }
    }
}
