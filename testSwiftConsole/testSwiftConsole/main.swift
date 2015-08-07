//
//  main.swift
//  testSwiftConsole
//
//  Created by Tran Duc Hieu on 8/6/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import Foundation

func getArgv(strContent:NSString) -> [String] {
    var strValue = String(strContent)
    var strArr = [String]()
    var tmpStr = ""
    
    for chr in strValue {
        if chr == " " {
            strArr.append(tmpStr)
            tmpStr = ""
        }
        else {
            tmpStr.append(chr)
        }
    }
    return strArr
}
print("Input your number: ")

var argc:Int = NSString(data:NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding)!.integerValue
println("argc: " + argc.description)

print("Input string of notes: ")

var argvString = NSString(data:NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding)
println("argvString: " + String(argvString!))

var argv = getArgv(argvString!)

println("Number of elements in array: " + String(argv.count))

for str in argv {
    
    println(str)
}
