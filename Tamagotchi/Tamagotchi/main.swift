//
//  main.swift
//  Tamagotchi
//
//  Created by Obied, Zack (NA) on 21/11/2019.
//  Copyright © 2019 Obied, Zack (NA). All rights reserved.
//

import Foundation

let tamagotchi = Tamagotchi(name: "John", gender: "Male")
let array = tamagotchi.getEverything()
for i in 0 ..< array.count {
    print(array[i])
}
print("")

func display() {
    let array = tamagotchi.getEverything()
    for i in 3 ..< array.count {
        print(array[i])
    }
    print("")
}

tamagotchi.eat()
tamagotchi.eat()
tamagotchi.eat()
tamagotchi.eat()
display()
tamagotchi.play()
tamagotchi.play()
tamagotchi.play()
tamagotchi.play()
display()
tamagotchi.heal()
display()
for _ in 0 ... 10 {
    tamagotchi.mature()
}
display()
