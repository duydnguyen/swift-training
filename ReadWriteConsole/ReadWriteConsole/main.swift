//
//  main.swift
//  ReadWriteConsole
//
//  Created by Tran Duc Hieu on 8/6/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import Foundation
//This program is shown how to read & write from console in swift

print("Enter your first name: ")

var firstName = NSString(data:NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding)

println("First name: " + String(firstName!))

print("Enter your last name: ")

var lastName = NSString(data:NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding)

println("Last name: " + String(lastName!))

print("Enter a number: ")

var number:Int = NSString(data:NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding)!.integerValue

println("Your number: " + number.description)
