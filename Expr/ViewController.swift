//
//  ViewController.swift
//  Expr
//
//  Created by khlee on 6/29/16.
//  Copyright © 2016 khlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputtedDigit: UILabel!
    @IBOutlet weak var result1: UILabel!
    
    
    @IBOutlet weak var inputtedString: UITextField!
    @IBOutlet weak var needleString: UITextField!
    @IBOutlet weak var result2: UILabel!
    
    @IBAction func performAction(sender: UIButton) {
        userIsInMiddleOfTyping = false
        let core = ExprCore()
        
        if let action = sender.currentTitle {
            if(action=="+"||action=="-"){
                inputtedDigit.text = action
                userIsInMiddleOfTyping = true
            }
            if(action=="Is Palindrome?"){
                if let operand = inputtedDigit.text {
                    core.setOperand(operand)
                    result1.text = core.doIsPalindrome()
                }
            }
            if(action=="Reverse"){
                if let operand = inputtedDigit.text {
                    core.setOperand(operand)
                    result1.text = core.doReverse();
                }
            }
            
            if(action==".strStr"){
                if let operand = inputtedString.text {
                    if let needle = needleString.text {
                        core.setOperand(operand)
                        result2.text = String(core.doStrStr(needle))
                    }
                }
            }
        }
        
    }
    var userIsInMiddleOfTyping = false
    
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if(userIsInMiddleOfTyping){
            inputtedDigit.text = inputtedDigit.text! + digit
        }else{
            inputtedDigit.text = digit
        }
        userIsInMiddleOfTyping = true
    }
}

