//
//  ViewController.swift
//  MyCalc
//
//  Created by Nick Sagan on 11.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var typingEnded: Bool = true
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBAction func calcPressed(_ sender: UIButton) {
        
        typingEnded = true
        let number = Double(resultsLabel.text!)!
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                resultsLabel.text = String(number * -1)
            }
            else if calcMethod == "%" {
                resultsLabel.text = String(number / 100)
            }
            else if calcMethod == "AC" {
                resultsLabel.text = "0"
            }
        }
    }
    
    @IBAction func numPressed(_ sender: UIButton) {
        
        if let numButtonPressed = sender.currentTitle {
            if typingEnded {
                resultsLabel.text = numButtonPressed
                typingEnded = false
            } else {
                resultsLabel.text! += numButtonPressed
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
}

