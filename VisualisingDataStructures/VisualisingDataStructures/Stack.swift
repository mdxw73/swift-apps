//
//  Stack.swift
//  VisualisingDataStructures
//
//  Created by Obied, Zack (NA) on 27/01/2020.
//  Copyright © 2020 Obied, Zack (NA). All rights reserved.
//

import Foundation

class Stack {

  var maxSize: Int = 10
  var array: [String] = [String](repeating: "_", count: 10)
  var pointer: Int = -1

  func push(_ value: String) -> [String] {
    if self.pointer == self.array.count - 1 {
      print("Error: array is full")
    } else {
      pointer += 1
      self.array[pointer] = value
    }
    return self.array
  }

  func pop() -> [String] {
    if self.pointer < 0 {
      print("Error: array is empty")
    } else {
      print("Value Popped: \(self.array[pointer])")
      self.pointer -= 1
    }
    return array
  }

}
