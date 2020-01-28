//
//  Queue.swift
//  VisualisingDataStructures
//
//  Created by Obied, Zack (NA) on 28/01/2020.
//  Copyright © 2020 Obied, Zack (NA). All rights reserved.
//

import Foundation

class Queue {

    var array: [String] = [String](repeating: "Empty", count: 5)
    var tail: Int = -1
    var head: Int = 0
    var headCount: Int = 0
    var tailCount: Int = 0

    func push(_ value: String) {
        if self.tailCount - headCount != array.count {
            if self.tail == array.count - 1 {
                self.tail = 0
            } else {
                self.tail += 1
            }
            array[tail] = value
            tailCount += 1
        }
    }

    func pop() {
        if tailCount != headCount {
            if head == array.count - 1 {
                head = 0
            } else {
                self.head += 1
            }
            self.headCount += 1
        }
    }
    
    func display() -> [String] {
        return self.array
    }
    
    func peek() -> String? {
        if tailCount != headCount {
            return array[head]
        }
        return nil
    }

}
