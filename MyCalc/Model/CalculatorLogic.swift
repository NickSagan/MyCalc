//
//  CalculatorLogic.swift
//  MyCalc
//
//  Created by Nick Sagan on 12.10.2021.
//

import Foundation

struct CalculatorLogic {
    
    func calculate(button: String, value: Double) -> Double {
        
        var newValue: Double = 0
        
            if button == "+/-" {
                newValue = value * -1
            }
            else if button == "%" {
                newValue = value / 100
            }
            else if button == "AC" {
                newValue = 0
            }
        return newValue
    }
    
}
