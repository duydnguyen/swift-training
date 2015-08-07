//
//  main.swift
//  test
//
//  Created by Tran Duc Hieu on 8/7/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import Foundation

var a:Int
var i:Int
var n:Int = 0
var first_time:Int
var variable:Double


var tmpArgc = NSString(data:NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding)?.integerValue

var argc = tmpArgc?.description

var argvString = NSString(data:NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding)

var argv = getArgv(argvString!)

param_set = 1;
verbosity = -1;

for i = 1; i <= argc; ++i {
    if argv[i] == "-v" {
        verbosity = argv[i].toInt()!
        i++
    }
        
    else if argv[i] == "-p" {
        param_set = argv[i+1].toInt()!
        i++;
    }
    else {
        let in_file = file.open(argv[i])
        if in_file == nil {
            print("Input file not found\n")
            exit(1)
        }
    }
}
