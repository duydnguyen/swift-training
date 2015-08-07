//
//  main.swift
//  PeopleDatabase
//
//  Created by Main Account on 10/3/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

// For more detail: http://www.raywenderlich.com/76044/learn-to-code-ios-apps-with-swift-tutorial-3

// Complete tutorial: http://www.raywenderlich.com/category/swift

import Foundation
var response: String
var people: [Person] = []

repeat {
  var newPerson = Person()
  newPerson.enterInfo()
  people.append(newPerson)
  newPerson.printInfo()
  
  print("Do you want to enter another name? (y/n)")
  response = input()
 
} while(response == "y")

print("Number of people in the database: \(people.count)")

for onePerson in people  {
  onePerson.printInfo()
}


