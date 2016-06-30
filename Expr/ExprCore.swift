//
//  ExprCore.swift
//  Expr
//
//  Created by khlee on 6/29/16.
//  Copyright © 2016 khlee. All rights reserved.
//

import Foundation
class ExprCore{
    
    private var operand:String=""
    func setOperand(operand:String){
        self.operand = operand
    }
    func doIsPalindrome()->String{
        let length = self.operand.characters.count
        let symbol = Array(self.operand.characters)[0]
        if(symbol=="+"||symbol=="-"){
            return "NO";
            
        }
        if((length==1)&&(symbol != "+")&&(symbol != "-")){
            return "YES";
        }
        let array = Array(self.operand.characters)
        
        for i in 0...(length+1)/2{
            
            if(array[i] != array[length-i-1]){
                return "NO";
            }
        }
        return "YES";
        
    }
    func doReverse()->String{
        let length = self.operand.characters.count-1
        let symbol = Array(self.operand.characters)[0]
        
        var temp = ""
        var end = -1
        if(symbol=="-"||symbol=="+"){
            end = 0
            temp.append(symbol)
        }
        print(temp)
        
        let array = Array(self.operand.characters)
        var i = length
        while(i>end){
            temp.append(array[i])
            i = i-1
        }
        
        return temp
    }
    func doStrStr(needles:String)->Int{
        var pos = -1;
        let lenOfString:Int
        let lenOfNeedle:Int
        lenOfString = self.operand.characters.count
        lenOfNeedle = needles.characters.count
        if(lenOfString<=0||lenOfNeedle<0||lenOfNeedle>lenOfString){
            return -1
        }
        if(self.operand==needles||lenOfNeedle==0){
            return 0
        }
        for i in 0...lenOfString {
            if(lenOfString-i<lenOfNeedle){
                return -1
            }else{
                let data = Array(self.operand.characters)
                let needledata = Array(needles.characters)
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
    func doMatching(operand:[Character], pos:Int, needle:[Character]) -> Bool{
        var temp = pos
        for i in 0...needle.count-1 {
            if(operand[temp] != needle[i]){
                return false
            }
            temp = temp+1
        }
        return true
    }
}