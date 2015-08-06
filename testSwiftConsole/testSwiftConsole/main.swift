//
//  main.swift
//  testSwiftConsole
//
//  Created by Tran Duc Hieu on 8/6/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import Foundation

println("Enter your name: ")
var name = NSString(data:NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding)

println("Hello " + String(name!))

