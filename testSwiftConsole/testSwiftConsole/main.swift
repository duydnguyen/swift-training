//
//  main.swift
//  testSwiftConsole
//
//  Created by Tran Duc Hieu on 8/6/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import Foundation

func removeEndedValue(str:String) -> String {
    var result = str
    if !result.characters.contains("\n") {
        return result
    }
    result.removeAtIndex(result.endIndex.predecessor())
    return result
}

func getArgv(strContent:NSString) -> [String] {
    let strValue = removeEndedValue(String(strContent))
    var strArr = [String]()
    var tmpStr = ""
    
    for chr in strValue.generate() {
        if chr == " " {
            strArr.append(tmpStr)
            tmpStr = ""
        }
        else {
            tmpStr.append(chr)
        }
    }
    if tmpStr != "" {
        strArr.append(tmpStr)
    }
    return strArr
}
print("Input your number: ")

var argc:Int = NSString(data:NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding)!.integerValue
print("argc: " + argc.description)

print("Input string of notes: ")

var argvString = NSString(data:NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding)
print("argvString: " + String(argvString!))

var argv = getArgv(argvString!)

print("Number of elements in array: " + String(argv.count))

for str in argv {
    
    print(str)
}
