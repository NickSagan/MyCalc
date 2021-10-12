//
//  ViewController.swift
//  MyCalc
//
//  Created by Nick Sagan on 11.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var typingEnded: Bool = true
    
    var calcLogic = CalculatorLogic()
    
    private var resultsLabelValue: Double {
        get {
            guard let number = Double(resultsLabel.text!)
            else {
                fatalError("Can't convert resultsLabel.text into Double")
            }
            return number
        }
        set {
            resultsLabel.text = String(newValue)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultsLabelValue = 0
    }
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBAction func calcPressed(_ sender: UIButton) {
        
        calcLogic.value = resultsLabelValue
        typingEnded = true
        if let calcMethod = sender.currentTitle {
            if let result = calcLogic.calculate(button: calcMethod){
                resultsLabelValue = result
            }
        }
    }
    
    @IBAction func numPressed(_ sender: UIButton) {
        
        if let numButtonPressed = sender.currentTitle {
            if typingEnded {
                resultsLabel.text = numButtonPressed
                typingEnded = false
            } else {
                
                if numButtonPressed == "." {
                    let currentDisplay = resultsLabelValue
                    let isInt = floor(currentDisplay) == currentDisplay
                    if !isInt{
                        return
                    }
                }
                resultsLabel.text! += numButtonPressed
            }
            
        }
    }
}

