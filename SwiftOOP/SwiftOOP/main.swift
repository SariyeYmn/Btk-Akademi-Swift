//
//  main.swift
//  SwiftOOP
//
//  Created by iOS-Lab11 on 29.02.2024.
//

import Foundation


print("Hello, World!")

let user = User(name: "Sare", age: 20, job: "Student" , tip: .NormalKullanici)

print(user.job)

user.job = "Software Engineer"

print(user.job)

user.exampleFunc()

print(user.tip)

let zeynep = OzelKullanici(name: "Zeynep", age: 22, job: "Software Engineer", tip: .NormalKullanici)

print(zeynep.name)

zeynep.exampleFunc()
zeynep.newFunction()
print(zeynep.sacRenginiAl())


