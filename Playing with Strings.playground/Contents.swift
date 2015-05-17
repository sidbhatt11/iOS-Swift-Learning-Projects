//: Playground - noun: a place where people can play

import UIKit

var hello = "Hello "

var myName = "Sid"

var greeting = hello + myName

for i in greeting {
    println(i)
}

var newGreeting = NSString(string: greeting)

newGreeting.substringToIndex(5)
newGreeting.substringFromIndex(6)
newGreeting.substringWithRange(NSRange(location: 6, length: 3))
newGreeting.containsString("sid")
newGreeting.containsString("Sid")
newGreeting.componentsSeparatedByString(" ")
newGreeting.uppercaseString
newGreeting.lowercaseString