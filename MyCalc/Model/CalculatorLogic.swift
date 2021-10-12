//
//  CalculatorLogic.swift
//  MyCalc
//
//  Created by Nick Sagan on 12.10.2021.
//

import Foundation

struct CalculatorLogic {
    
    var value: Double?
    var midCalc: (n1: Double, calc: String)?
    
    mutating func calculate(button: String) -> Double {
        
        var newValue: Double = 0
        
        if let num = value {
            switch button {
            case "+/-": newValue = num * -1
            case "%": newValue = num / 100
            case "AC": newValue = 0
            case "=": newValue = finalCalc(num)
            default: midCalc = (n1: num, calc: button)
                    }
        }
        return newValue
    }
    
    func finalCalc(_ n2: Double) -> Double{
        var finalResult: Double = 0
        if let n1 = midCalc?.n1, let calc = midCalc?.calc {
            var result: Double = 0
            switch calc {
            case "+": result = n1 + n2
            case "-": result = n1 - n2
            case "×": result = n1 * n2
            case "÷": result = n1 / n2
            default: result = 0
                    }
            finalResult = result
        }
        return finalResult
    }
}
