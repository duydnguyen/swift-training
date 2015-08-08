//
//  main.swift
//  StringProcessing
//
//  Created by Tran Duc Hieu on 8/7/15.
//  Copyright © 2015 Duy-Hieu. All rights reserved.
//

import Foundation

// Find string in line (Ex: "Note   2200   2633 60")

func stringInLine(line:String) -> String {
    var str = ""
    
    for chr in line.generate() {
        if chr>="0" && chr<="9" {
            continue
        }
        else {
            str.append(chr)
        }
    }
    return str
}

var line:String = "Note   2200   2633 60"
var noteword:String = stringInLine(line)

print(noteword + "\n")
