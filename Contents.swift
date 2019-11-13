import Cocoa
/*:
 # FACTORIALS
 Functions which take in an integer and return the factorial of that integer
 
 Exapmle: 5! = 5 * 4 * 3 * 2 * 1 = 120
 */
//Factorial using a For In Loop
func firstFactorial(_ num: Int) -> Any {
    var fact = num
    if num > 1 && num < 20 {
        for i in 1..<num {
            fact = fact * i
        }
    }
    return "F1: The Factorial of \(num) is \(fact)."
}

//Factorial using Recursion
func secondFactorial(_ num: Int) -> Int {
    var fact = num
    if num == 0 {
        fact = 1
    } else {
        fact = fact * secondFactorial((num - 1))
    }
    return fact
}

//Factorial using Reduce
func thirdFactorial(_ num: Int) -> Int {
    return (1...max(num, 1)).reduce(1, *)
}

print(firstFactorial(5))
print("F2: The Factorial of 4 is \(secondFactorial(4))")
print("F3: The Factorial of 6 is \(thirdFactorial(6))")

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
# TRIPLETS
Take in two triplets (a and b) with Integers and compare the integer values for both triplets.
Return an array of Integers for the points for a and b [scoreA, scoreB]
* If a[i] > b[i], then a recieves 1 point,
* If b[i] > a[i], then b recieves 1 point,
* If a[i] == b[i], then neither recieve the point.
* Constraints: i must be between 1-100
 */
func scoreOfTwoTriplets(a: (Int, Int, Int), b: (Int, Int, Int)) -> [Int] {
    var scoreA = 0
    var scoreB = 0
    if a.0 > b.0 {
        scoreA += 1
    } else if a.0 < b.0 {
        scoreB += 1
    }
    if a.1 > b.1 {
         scoreA += 1
    } else if a.1 < b.1 {
         scoreB += 1
     }
    if a.2 > b.2 {
         scoreA += 1
    } else if a.2 < b.2 {
         scoreB += 1
     }
    let scoreArray = [scoreA, scoreB]
    return scoreArray
}

func getScore(a: (Int, Int, Int), b: (Int, Int, Int)) -> String {
    let score = scoreOfTwoTriplets(a: a, b: b)
    var message = "A: \(a.0), \(a.1), \(a.2)\n    B: \(b.0), \(b.1), \(b.2)\n"
    message += "    The Score is \(score[0]):\(score[1])"
    if score[0] > score[1] {
        message += " A Wins!"
    } else {
        message += " B Wins!"
    }
    return message
}

let a = (1,3,5)
let b = (3,3,6)

print("T1:", getScore(a: a, b: b))

/*:
 # SQUARE MATRIX
 Function must take in an array of arrays, which make up a square matrix. When those nintegers are arranged in the square matrix, the function must return the absolute difference of the diagonal sums.
* Example:  Array = [1, 2, 3, 4, 5, 6 7, 8, 9]
* 1 2 3
* 4 5 6
* 9 8 9

 1 + 5 + 9 =  15   &&   9 + 5 + 3  17
 
 | 15 - 17 |  = 2
*/
func diagonalDifference(array: [[Int]]) -> Int {
    let rows = array.count
    var sumOne = Int()
    var sumTwo = Int()
    for index in 0..<rows {
        if array[index].count == rows {
            sumOne += array[index][index]
            sumTwo += array[rows - index - 1][index]
        } else { return 0 }
    }
    let difference = abs(sumOne - sumTwo)
    return difference
}

func printMatrix(array: [[Int]]) -> String {
    let rows = array.count
    var matrix = ""
    for index in 0..<rows {
        if array[index].count == rows {
            let row = array[index]
            matrix += "\n    \(row)"
        } else { return "\n    Incorrect input. Each array.count must equal the total amount of arrays." }
    }
    return matrix
}

let array = [[1,-12,3, 3],[4,5,6, 4],[4,8,-19, 1], [2, 4, 5, 1]]
print("M1: For the Matrix :", printMatrix(array: array), "\n    The Absolute Value of the Diagonal Difference =", diagonalDifference(array: array))

/*:
 # STRINGS
 A function which takes in a number of steps taken on a hike (n), and a string with D's (down) and U's (up) details about the hike. Each D/U represents 1 step up or down. A valley or mountain starts at sea level, an must go up/down equal units to finish at sea level, Return an Integer which represents the number of valleys walked through
* Example:
 n = 8 ,  s = UDDDUDUU,  return  1 Valley hiked through
*/
func countingValleys(steps: Int, elevationChange: String) -> String {
    var elevation = 0
    var valleysHikedThrough = 0
    var atSeaLevel = true
    if steps == elevationChange.count {
        for step in elevationChange {
            elevation += step == "U" ? 1 : -1
            if elevation < 0 && atSeaLevel {
                valleysHikedThrough += 1
                atSeaLevel = false
            }
            if elevation == 0 {
                atSeaLevel = true
            }
        }
        return "\(valleysHikedThrough)"
    } else {
        return "Invalid Input"
    }
}

let stepsTaken = 8
let altitudeChange = "UDDDUDUU"
print("S1: If you Aaron takes \(stepsTaken) steps, and the altitude change was \(altitudeChange), then he hiked through \(countingValleys(steps: stepsTaken, elevationChange: altitudeChange)) valley(s).")
