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
    @IBOutlet weak var needle: UITextField!
    @IBOutlet weak var result2: UILabel!
    
    

    
    @IBAction func performAction(sender: UIButton) {
        userIsInMiddleOfTyping = false
        
        if let action = sender.currentTitle {
            if(action=="+"||action=="-"){
                inputtedDigit.text = action
                userIsInMiddleOfTyping = true
            }else{
                
            }
            if(action=="Is Palindrome?"){
                if(doIsPalindrome()){
                    result1.text = "YES"
                }else{
                    result1.text = "NO"
                }
            }
            if(action=="Reverse"){
                result1.text = doReverse();
            }
            
            if(action==".strStr"){
                result2.text = String(doStrStr());
            }
        }
        
    }
    var userIsInMiddleOfTyping = false
    
    func doIsPalindrome() -> Bool{
        if let data = inputtedDigit.text{
            
            let length = data.characters.count
            let symbol = Array(data.characters)[0]
            if(symbol=="+"||symbol=="-"){
                return false;
                
            }
            if((length==1)&&(symbol != "+")&&(symbol != "-")){
                return true;
            }
            let array = Array(data.characters)
            
            for i in 0...(length+1)/2{
                
                if(array[i] != array[length-i-1]){
                    return false;
                }
            }
            return true;
            
        }else{
            return false;
        }
    }
    func doReverse()->String {
        if let data = inputtedDigit.text{
            let length = data.characters.count-1
            let symbol = Array(data.characters)[0]
            
            var temp = ""
            var end = -1
            if(symbol=="-"||symbol=="+"){
                end = 0
                temp.append(symbol)
            }
            print(temp)
            
            let array = Array(data.characters)
            var i = length
            while(i>end){
                temp.append(array[i])
                i = i-1
            }
            
            return temp
            
        }else{
            return ""
        }
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if(userIsInMiddleOfTyping){
            inputtedDigit.text = inputtedDigit.text! + digit
        }else{
            inputtedDigit.text = digit
        }
        userIsInMiddleOfTyping = true
    }
    
    
    func doStrStr() -> Int{
        var pos = -1;
        let lenOfString:Int
        let lenOfNeedle:Int
        if let haystack = inputtedString.text {
            lenOfString = haystack.characters.count
            if let needlestack = needle.text {
                lenOfNeedle = needlestack.characters.count
                if(lenOfString<=0||lenOfNeedle<0||lenOfNeedle>lenOfString){
                    return -1
                }
                if(haystack==needlestack||lenOfNeedle==0){
                    return 0
                }
                for i in 0...lenOfString {
                    if(lenOfString-i<lenOfNeedle){
                        return -1
                    }else{
                        let data = Array(haystack.characters)
                        let needledata = Array(needlestack.characters)
                        if(data[i]==needledata[0]){
                            if(doMatching(data, pos: i, needle: needledata)){
                                pos = i
                                return pos
                            }else{
                                continue
                            }
                        }else{
                            continue
                        }
                    }
                }
                return -1
            }
        }
        return -1
    }
    func doMatching(haystack:[Character], pos:Int, needle:[Character]) -> Bool{
        var temp = pos
        for i in 0...needle.count-1 {
            if(haystack[temp] != needle[i]){
                return false
            }
            temp = temp+1
        }
        return true
    }

}

