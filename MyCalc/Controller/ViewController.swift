//
//  ViewController.swift
//  MyCalc
//
//  Created by Nick Sagan on 11.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var typingEnded: Bool = true
    private var calcLogic = CalculatorLogic()
    
    private var resultsLabelValue: Double {
        get {
            guard let number = Double(resultsLabel.text!)
            else {
                fatalError("Can't convert resultsLabel.text into Double")
            }
            return number
        }
        set {
            let isNotFloating = floor(newValue) == newValue
            if isNotFloating {
                resultsLabel.text = String(Int(newValue))
            } else {
                resultsLabel.text = String(newValue)
            }
        }
    }
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBAction func calcPressed(_ sender: UIButton) {
        
        // What should happen when pressed: + - = * / AC %
        calcLogic.value = resultsLabelValue
        typingEnded = true
        if let calcMethod = sender.currentTitle {
            if let result = calcLogic.calculate(button: calcMethod){
                resultsLabelValue = result
            }
        }
    }
    
    @IBAction func numPressed(_ sender: UIButton) {
        
        // What should happen when numbers or "." pressed
        
        if let numButtonPressed = sender.currentTitle {
            if typingEnded {
                
                if numButtonPressed == "." {
                    if resultsLabel.text!.contains("."){
                        return
                    }
                    
                    if resultsLabel.text! == "0"{
                        resultsLabel.text! = "0."
                        typingEnded = false
                        return
                    }
                }
                
                resultsLabel.text = numButtonPressed
                typingEnded = false
                
            } else {
                if numButtonPressed == "." {
                    if resultsLabel.text!.contains("."){
                        return
                    }
                }
                
                resultsLabel.text! += numButtonPressed
            }
            
        }
    }
}

