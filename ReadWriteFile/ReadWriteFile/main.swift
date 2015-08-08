//
//  main.swift
//  ReadWriteFile
//
//  Created by Tran Duc Hieu on 8/6/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

// Working with Files in Swift on iOS 8 or newer
// For more details: http://www.techotopia.com/index.php/Working_with_Files_in_Swift_on_iOS_8

import Foundation

// Working with file using NSFileManager

/*
let filemgr = NSFileManager.defaultManager()
let currentPath = filemgr.currentDirectoryPath
let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
let docsDir = dirPaths[0] as! String
let tmpDir = NSTemporaryDirectory() as String

println("Current path: " + String(currentPath))
println("Directory path: " + String(stringInterpolationSegment: dirPaths))
println("Docs directory: " + String(docsDir))
println("Temp dir: " + String(tmpDir))
*/

// Creating an NSFileManager
let filemgr = NSFileManager.defaultManager()

var fileIn:String = NSHomeDirectory() + "/Desktop/Swift Training/ReadWriteFile/ReadWriteFile/data.inp"
var fileOut:String = NSHomeDirectory() + "/Desktop/Swift Training/ReadWriteFile/ReadWriteFile/data.out"

// Checking for the Existence of a File
if filemgr.fileExistsAtPath(fileIn) {
    print("File " + fileIn + " exists!\n")
} else {
    print("File " + fileIn + " not found!\n")
}


// Checking if a File is Readable/Writable/Executable/Deletable
if filemgr.isWritableFileAtPath(fileOut) {
    print("File " + fileOut + " is writable!\n")
} else {
    print("File " + fileOut + " is read-only!\n")
}


// Reading and Writing Files with NSFileManager

// Reading content of a file
var dataBuffer:NSData
dataBuffer = filemgr.contentsAtPath(fileIn)!
var lineContent = NSString(data: dataBuffer, encoding: NSUTF8StringEncoding)
print(String(lineContent!) + "\n")

// Writting contents to a file
lineContent = "New content to file\n"
dataBuffer = lineContent!.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
filemgr.createFileAtPath(fileOut, contents: dataBuffer, attributes: nil)

// Comparing the Contents of Two Files
if filemgr.contentsEqualAtPath(fileIn, andPath: fileOut) {
    print("File contents match\n")
} else {
    print("File contents do not match\n")
}


// Moving/Renaming a File
var error: NSError?

if filemgr.moveItemAtPath(fileIn, toPath: NSHomeDirectory() + "data.txt", error: &error) {
    print("Move successful\n")
} else {
    print("Moved failed with error: \(error!.localizedDescription)\n")
}


// Copying a file
if filemgr.copyItemAtPath(fileIn, toPath: NSHomeDirectory(), error: &error) {
    print("Copy successful\n")
} else {
    print("Copy failed with error: \(error!.localizedDescription)\n")
}


// Removing a File
if filemgr.removeItemAtPath(fileOut, error: &error) {
    print("Remove successful\n")
} else {
    print("Remove failed: \(error!.localizedDescription)\n")
}


// Creating a Symbolic Link
if filemgr.createSymbolicLinkAtPath(fileIn,
    withDestinationPath: NSHomeDirectory(), error: &error) {
        print("Link successful\n")
} else {
    print("Link failed: \(error!.localizedDescription)\n")
}


