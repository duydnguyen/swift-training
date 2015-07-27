//
//  Stack.swift
//  Calculator
//
//  Created by tien on 7/12/14.
//  Copyright (c) 2014 tien. All rights reserved.
//


class Stack {
    
    var array:Array<String> = [];
    
    func push(value:String){
        if value != "" {
            self.array.append(value);
        }        
    }
    func pop()->String{
        var index = self.array.count - 1;
        var value = self.array[index];
        self.array.removeLast();
        return value;
    }
    func peep()->String{
        var index = self.array.count - 1;
        var value = self.array[index];
        return value;
    }
    
    func isEmpty()-> Bool{
        return self.array.isEmpty;
    }
}
