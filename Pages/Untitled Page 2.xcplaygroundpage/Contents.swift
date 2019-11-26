//: [Previous](@previous)
import Foundation
/*:
# ARRAYS
 
 
Function that returns the sum of Integers in an array
*/
func sumOfIntegerArray(_ arrayOfInts: [Int]) -> Any {
    var sum = Int()
    for int in arrayOfInts {
        sum = sum + int
    }
    return "A1: The Sum of the Integers \(arrayOfInts) is \(sum)"
}

print(sumOfIntegerArray([1,2,3,4,5]))

/*:
Function that returns how many matching number pairs exist in an array of Integers
* Array: [Int] = 10, 10, 20, 10, 30, 20, 10, 40, 50]
* The total pairs = 3  (10, 10, & 20)
*/
func pairsInArray(_ array: [Int]) -> Int {
    var pairs = Int()
    let dictionaryOfPairs = array.reduce(into: [:]) { (pairCount, int) in
        pairCount[int, default: 0] += 1
    }
    for item in dictionaryOfPairs {
        if item.value > 1 && item.value % 2 == 0 {
            pairs += item.value / 2
        } else if item.value > 1 && item.value % 2 != 0 {
            pairs += (item.value - 1) / 2
        }
    }
    return pairs
}

let pairsArray = [1, 2, 3, 1, 2, 1, 1, 1]
print("A2: The number of matching pairs in the array: \(pairsArray) = \(pairsInArray(pairsArray))")

/*:
Function takes in an array and prints precise decimals describing the percentage/fraction of positive, negative, and 0 values.
* Array: [Int] = [1,1,0,-1,-1]
* +) 0.400000
* - ) 0.400000
* 0) 0.200000
*/
func plusMinus(arr: [Int]) -> String {
    var printStatement = "A3: The fractions of +/-/0 values in the array \(arr) = \n"
    let totalInts = arr.count
    var positive = 0
    var negative = 0
    var zero = 0
    for int in arr {
        if int > 0 {
            positive += 1
        } else if int < 0 {
            negative += 1
        } else {
            zero += 1
        }
    }
    printStatement += String(format: "    +) %.6f \n", (Float(positive) / Float(totalInts)))
    printStatement += String(format: "    -) %.6f \n", (Float(negative) / Float(totalInts)))
    printStatement += String(format: "    0) %.6f", (Float(zero) / Float(totalInts)))
    return printStatement
}

let plusMinusArray = [1,3,-4,0,2,-1,0,0,0,-1]
print(plusMinus(arr: plusMinusArray))

/*:
Function which returns true or false if an array of Integers contains three consecutive numbers in a row
* Example One:  [1, 2, 4, 7, 2, 8] = false
* Example Two: [2, 3, 5, 6, 7, 9] = true
*/
func tripleThreat(array: [Int]) -> Bool {
    var counter = 0
    var last = array.first ?? 0
    var next = 0
    for int in array {
        next = int
        if next == (last + 1) {
            counter += 1
            if counter == 2 { return true }
        } else {
            counter = 0
        }
        last = int
    }
    return false
}

let ints = [1, 2, 4, 2, 3, 4]
print("A4: The array \(ints) contains three consecutive numbers in a row: ", tripleThreat(array: ints))

/*:
Function that takes in an array of 5 Integers, and prints the MAX and the MIN possible sums of 4 out of the five Integers
* Array = [1, 3, 5, 7, 9]
* Print: 16  24
*/
func minMaxSum(array: [Int]) -> Any {
    if array.count == 5 {
        var minValue = array.first
        var maxValue = array.first
        for int in array {
            if int < minValue ?? 0 {
                minValue = int
            }
            if int > maxValue ?? 0 {
                maxValue = int
            }
        }
        let sum = array.reduce(0, +)
        let minSum = sum - (maxValue ?? 0)
        let maxSum = sum - (minValue ?? 0)
        return (minSum, maxSum)
    }
    return "Invalid Input"
}

let minMaxArray = [3, 3, 5, 7, 11]
print("A4: The Min and Max Sums for 4/5 Ints in the array: \(minMaxArray) are \(minMaxSum(array: minMaxArray))")
//: [Next](@next)
