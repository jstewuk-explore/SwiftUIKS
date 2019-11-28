//
//  Rounding.swift
//  Numbers
//
//  Created by James Stewart on 11/26/19.
//  Copyright © 2019 James Stewart. All rights reserved.
//

@propertyWrapper

struct RoundedTo {
    private var value: Double = 0
    private var multiplier: Double = 1
    
    var wrappedValue: Double {
        get {
            value
        }
        set {
            value = (newValue * multiplier).rounded() / multiplier
        }
    }
    
    init(_ precision: Int) {
        guard precision >= 0 && precision <= 3 else {
            fatalError("Rounding is only supported for precison, 0, 1, 2, 3")
        }
        multiplier = [1, 10, 100, 1000][precision]
        self.wrappedValue = wrappedValue
    }
}
