//
//  main.swift
//  ReadWriteConsole
//
//  Created by Tran Duc Hieu on 8/6/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import Foundation
//This program is shown how to read & write from console in swift

print("Enter your name: ")

var name = NSString(data:NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding)

println("Hello " + String(name!))

