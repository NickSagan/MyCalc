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
    
    // We use this var to get value from UILabel.text and also to update UILabel after this value was changed
    private var resultsLabelValue: Double {
        get {
            guard let number = Double(resultsLabel.text!)
            else {
                fatalError("Can't convert resultsLabel.text into Double")
            }
            return number
        }
        set {
            resultsLabel.text = String(format: "%g", newValue)
        }
    }
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBAction func calcPressed(_ sender: UIButton) {
        
        // What should happen when pressed: + - = * / AC %
        
        // Send current value from UILabel to Calculator Logic
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

