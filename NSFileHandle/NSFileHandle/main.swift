//
//  main.swift
//  NSFileHandle
//
//  Created by Tran Duc Hieu on 8/6/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

// Working with Files in Swift on iOS 8 or newer
// For more details: http://www.techotopia.com/index.php/Working_with_Files_in_Swift_on_iOS_8

import Foundation

// Working with file using NSFileHandle Class

//Creating an NSFileHandle Object
var fileIn:String = NSHomeDirectory() + "/Desktop/Swift Training/NSFileHandle/NSFileHandle/quickfox.inp"
var fileOut:String = NSHomeDirectory() + "/Desktop/Swift Training/NSFileHandle/NSFileHandle/quickfox.out"

var file: NSFileHandle? = NSFileHandle(forReadingAtPath: fileIn)

if file == nil {
    println("File " + fileIn + "open failed!")
} else {
    file?.closeFile()
}


// NSFileHandle File Offsets and Seeking
file = NSFileHandle(forUpdatingAtPath: fileIn)
if file == nil {
    println("File open failed")
} else {
    println("Offset = \(file?.offsetInFile)")
    file?.seekToEndOfFile()
    println("Offset = \(file?.offsetInFile)")
    file?.seekToFileOffset(30)
    println("Offset = \(file?.offsetInFile)")
    file?.closeFile()
}


// Reading Data from a File
file = NSFileHandle(forUpdatingAtPath: fileIn)
if file == nil {
    println("File open failed")
} else {
    file?.seekToFileOffset(10)
    let databuffer = file?.readDataOfLength(5)
    file?.closeFile()
}


// Writing Data to a File
file = NSFileHandle(forUpdatingAtPath: fileOut)

if file == nil {
    println("File open failed")
} else {
    let data = ("black dog" as NSString).dataUsingEncoding(NSUTF8StringEncoding)
    file?.seekToFileOffset(10)
    file?.writeData(data!)
    file?.closeFile()
}


// Truncating a File
file = NSFileHandle(forUpdatingAtPath: fileIn)

if file == nil {
    println("File open failed")
} else {
    file?.truncateFileAtOffset(0)
    file?.closeFile()
}
