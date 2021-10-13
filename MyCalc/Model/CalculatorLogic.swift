//
//  CalculatorLogic.swift
//  MyCalc
//
//  Created by Nick Sagan on 12.10.2021.
//

import Foundation

struct CalculatorLogic {
    
    // Used to save current value from UILabel
    var value: Double?
    // Used to save value inputed before pressing any calculation button
    var midCalc: (n1: Double, calc: String)?
    // Temporary var for continious "=" button pressing
    var tempNum: Double?
    
    // managing calculation after calculation UIbutton pressed
    mutating func calculate(button: String) -> Double? {
        
        var newValue: Double? = 0
        
        if let num = value {
            switch button {
            case "+/-": newValue = num * -1
            case "%": newValue = num / 100
            case "AC": newValue = 0
                midCalc?.calc = ""
                midCalc?.n1 = 0
            case "=": newValue = finalCalc(num)
            // All other buttons here (+, -, *, /)
            default:
                // Setting our midCalc and tempNum to default values
                midCalc = (n1: num, calc: button)
                tempNum = nil
                    }
        }
        return newValue
    }
    
    mutating func finalCalc(_ n2: Double) -> Double? {

        // check if midcalc buttons (+, -, / or *) were pressed before
        if let n1 = midCalc?.n1, let calc = midCalc?.calc {

            // Check if AC button was pressed
            if calc == "" {
                // Return nil if AC button were pressed right before
                return nil
            }
            
            // Checking if "=" button was pressed 1st time
            if tempNum == nil {
                
                // Using this temp var to store temporary value in case if user will press "=" button again
                tempNum = n2
                // Calculate logic
                switch calc {
                case "+": return n1 + n2
                case "-": return n1 - n2
                case "×": return n1 * n2
                case "÷": return n1 / n2
                default: return nil
                        }
            // If "=" button was pressed 2nd time and more
            } else {
                switch calc {
                case "+": return tempNum! + n2
                case "-": return n2 - tempNum!
                case "×": return tempNum! * n2
                case "÷": return n2 / tempNum!
                default: return nil
                        }
            }

        }
        // if midcalc buttons (+, -, / or *) were NOT pressed before
        return nil
    }
}
