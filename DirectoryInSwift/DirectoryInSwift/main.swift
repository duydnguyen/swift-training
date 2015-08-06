//
//  main.swift
//  DirectoryInSwift
//
//  Created by Tran Duc Hieu on 8/6/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

// Working with Directories in Swift on iOS 8 or newer
// For more details: http://www.techotopia.com/index.php/Working_with_Directories_in_Swift_on_iOS_8

import Foundation

// Obtaining a Reference to the Default NSFileManager Object
let filemgr = NSFileManager.defaultManager()


// Identifying the Current Working Directory
let currentPath = filemgr.currentDirectoryPath
println("Current path: " + String(currentPath))


// Identifying the Documents Directory
let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
println("Directory path: " + String(stringInterpolationSegment: dirPaths))

let docsDir = dirPaths[0] as! String
println("Docs directory: " + String(docsDir))


// Identifying the Temporary Directory
let tmpDir = NSTemporaryDirectory() as String
println("Temp dir: " + String(tmpDir))


// Changing Directory
let filemgr1 = NSFileManager.defaultManager()

let dirPaths1 = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
				.UserDomainMask, true)

let docsDir1 = dirPaths1[0] as! String

if filemgr1.changeCurrentDirectoryPath(docsDir1) {
    // Success
} else {
    // Failure
}


// Creating a New Directory
let filemgr2 = NSFileManager.defaultManager()

let dirPaths2 = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
    .UserDomainMask, true)

let docsDir2 = dirPaths2[0] as! String
let newDir = docsDir2.stringByAppendingPathComponent("data")

var error: NSError?

if !filemgr2.createDirectoryAtPath(newDir,
    withIntermediateDirectories: true,
    attributes: nil,
    error: &error) {
        
        println("Failed to create dir: \(error!.localizedDescription)")
}


// Deleting a Directory
var error1: NSError?

if !filemgr.removeItemAtPath(newDir, error: &error1) {
    println("Failed to delete directory: \(error1!.localizedDescription)")
}


// Listing the Contents of a Directory
let filemgr3 = NSFileManager.defaultManager()
let filelist = filemgr3.contentsOfDirectoryAtPath("/", error: &error)

for filename in filelist! {
    println(filename)
}


// Getting the Attributes of a File or Directory
let filemgr4 = NSFileManager.defaultManager()

var error4: NSError?

let attribs: NSDictionary? = filemgr4.attributesOfItemAtPath(
    "/Applications", error: &error4)

if let fileattribs = attribs {
    let type = fileattribs["NSFileType"] as! String
    println("File type \(type)")
}
