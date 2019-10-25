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
