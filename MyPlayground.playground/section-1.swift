// Playground - noun: a place where people can play

import UIKit

/*
var str = "Hello, playground"

var a = 3.5
var b = 4
var c:Double = a * Double(b)

str = "\(a) times \(b) is \(c)"

var arr = [1,2,3,4,5]
arr.append(6)
print(arr)
arr.removeAtIndex(3)

print(arr)

var optionalString: String? = "Hello"

optionalString == nil

var optionalName: String? = "John Smith"
//optionalName = nil
var greeting = "Hello!"

if let name = optionalName {
    greeting = "Hello, \(name) !"
}else{
    greeting = "Hello Human !"
}

greeting

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var kindOfNumber:String? = nil
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            kindOfNumber = kind
        }
    }
}
kindOfNumber
largest

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("Bob", "Tuesday")

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)

func avgOf(numbers:Int...)->Int{

    var count = 0
    var sum = 0
    for number in numbers{
        count++
        sum = sum + number
    }

    return sum/count
}

avgOf(5,10,15)

func hasAnyMatches(list:[Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)

func returnMultiple()->(Double,Double,Double){
    return (3.5,4.5,5.5)
}

let (aa,bb,cc) = returnMultiple()

println(aa,bb,cc)
println(aa)


let aaa = numbers.map({
(number: Int) -> Int in
    var result = 0
    if(number%2 == 0)
    {
        result = 3 * number
    }else{
        result = 0
    }
    return result
})

println(aaa)



var arr = [2,4,6,8]
arr.removeAtIndex(0)
arr.append(10)

println(arr)

 var dict = [
    "name":"Sid",
    "age":"19"
]
var name = "name"
var age = "age"
println("My name is \(dict[name]!)")
println("My age is \(dict[age]!)")



func primeOrNot(number: Double) ->Bool {
    
    var primeOrNot:Bool = true
    
    for var i:Double = 2; i < number/2.0; i++ {
        if number % i == 0.0 {
            primeOrNot = false
        }
    }
    
    return primeOrNot
}

var no:Double = 9

var isPrime:Bool = primeOrNot(no)

println("\(no) is a prime ? : \(isPrime)")

*/








