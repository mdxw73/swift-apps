//
//  Stack.swift
//  VisualisingDataStructures
//
//  Created by Obied, Zack (NA) on 27/01/2020.
//  Copyright © 2020 Obied, Zack (NA). All rights reserved.
//

import Foundation

class Stack {
    
    var array: [String] = [String](repeating: "Empty", count: 5)
    var pointer: Int = -1

    func push(_ value: String) {
        if self.pointer != self.array.count - 1 {
            pointer += 1
            self.array[pointer] = value
        }
    }

    func pop() {
        if self.pointer >= 0 {
            self.pointer -= 1
        }
    }
    
    func display() -> [String] {
        return self.array
    }
    
    func peek() -> String? {
        if pointer != -1 {
            return array[pointer]
        }
        return nil
    }
    
}
