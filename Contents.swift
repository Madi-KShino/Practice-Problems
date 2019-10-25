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
Functions which take in an array and execute some logic
*/
//Take in an array of integers and return the sum of those integers
func sumOfIntegerArray(_ arrayOfInts: [Int]) -> Any {
    var sum = Int()
    for int in arrayOfInts {
        sum = sum + int
    }
    return "A1: The Sum of the Integers \(arrayOfInts) is \(sum)"
}

print(sumOfIntegerArray([1,2,3,4,5]))

/*:
# TRIPLETS
Functions which take in triplets and return some logic
*/
//Take in two triplets (a and b) with Integers and compare the integern values for both triplets.
//If a[i] > b[i], then a recieves 1 point
//If b[i] > a[i], then b recieves 1 point
//If a[i] == b[i], then neither recieve the point
//Constraints: i must be between 1-100
//Return an array of Integers for the points for a and b [scoreA, scoreB]
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
    message += "    The Score is \(score[0]):\(score[1])."
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
