//
//  main.swift
//  HackerRankProblems
//
//  Created by Erica Y Stevens on 6/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

var funk: [String:()->Void] = [:]

func solveMeFirst() {
    // read integers line by line
    let a = Int(readLine()!)!
    let b = Int(readLine()!)!
    
    // Hint: Type print(a + b) below
    print(a + b)
}

funk["solveMeFirst"] = solveMeFirst

//https://www.hackerrank.com/challenges/simple-array-sum

//Sample Input:
/*
 6
 1 2 3 4 10 11
 */

//Sample Output:
/*
 31
 */

func simpleArraySum() {
    // number of elements
    //  let n = Int(readLine()!)!
    
    // read array and map the elements to integer
    let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    
    let sum = arr.reduce(0) { (result, n) -> Int in
        return result + n
    }
    
    print(sum)
}

funk["simpleArraySum"] = simpleArraySum

//https://www.hackerrank.com/challenges/compare-the-triplets
//Sample Input:
/*
 5 6 7
 3 6 10
 */

//Sample Output:
/*
 1 1
 */

func compareTheTriplets() {
    var arr1Points = 0
    var arr2Points = 0
    
    let arr1 = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let arr2 = readLine()!.components(separatedBy: " ").map { Int($0)! }
    
    if arr1.count == 3 && arr2.count == 3 {
        for i in 0..<arr1.count {
            if arr1[i] > arr2[i] {
                arr1Points += 1
            } else if arr1[i] < arr2[i] {
                arr2Points += 1
            } else if arr1[i] == arr2[i] {
                continue
            }
        }
    } else {
        print("Both arrays must have three elements. Try again:")
        compareTheTriplets()
    }
    
    print("\(arr1Points), \(arr2Points)")
}

funk["compareTheTriplets"] = compareTheTriplets


//https://www.hackerrank.com/challenges/a-very-big-sum?h_r=next-challenge&h_v=zen
//Sample Input:
/*
 5
 1000000001 1000000002 1000000003 1000000004 1000000005
 */

//Expected Output:
//5000000015

func aVeryBigSum() {
    // number of elements
    let n = Int(readLine()!)!
    
    // read array and map the elements to integer
    let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    
    let sum = arr.reduce(0) { (r, n) -> Int in
        return r + n
    }
    
    print("\(sum)")
}
funk["veryBigSum"] = aVeryBigSum

//https://www.hackerrank.com/challenges/diagonal-difference?h_r=next-challenge&h_v=zen
//Sample Input:
/*
 3
 11 2 4
 4 5 6
 10 8 -12
 */

//Expected Output:
//15

func diagonalDifference() {
    // read the integer n
    let n = Int(readLine()!)!
    
    var incrementingIndex = 0
    var primaryDiagonalSum = 0
    
    var decrementingIndex = n - 1
    var secondaryDiagonalSum = 0
    
    // declare 2d array
    var arr: [[Int]] = []
    
    // read array row-by-row
    for _ in 0..<n {
        arr.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
        
        let primaryDiagonalNum = arr[incrementingIndex][incrementingIndex]
        primaryDiagonalSum += primaryDiagonalNum
        
        let secondaryDiagonalNum = arr[incrementingIndex][decrementingIndex]
        secondaryDiagonalSum += secondaryDiagonalNum
        
        incrementingIndex += 1
        decrementingIndex -= 1
    }
    let diagonalDiff = primaryDiagonalSum - secondaryDiagonalSum
    print(abs(diagonalDiff))
}

funk["diagonalDifference"] = diagonalDifference

//https://www.hackerrank.com/challenges/plus-minus?h_r=next-challenge&h_v=zen
//Sample Input:
/*
 6
 -4 3 -9 0 4 1
 */

//Expected Output:
/*
 0.500000
 0.333333
 0.166667
 */

func plusMinus() {
    // number of elements
    let n = Int(readLine()!)!
    
    // read array and map the elements to integer
    let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    
    var posNumCount = 0
    var negNumCount = 0
    var zeroCount = 0
    
    for num in arr {
        switch num {
        case num where num > 0:
            posNumCount += 1
        case num where num < 0:
            negNumCount += 1
        case num where num == 0:
            zeroCount += 1
        default:
            continue
        }
    }
    
    let posRatioString = String(format: "%.6f",Double(posNumCount)/Double(arr.count))
    let negRatioString = String(format: "%.6f",Double(negNumCount)/Double(arr.count))
    let zeroRatioString = String(format: "%.6f",Double(zeroCount)/Double(arr.count))
    
    print(posRatioString)
    print(negRatioString)
    print(zeroRatioString)
}

funk["plusMinus"] = plusMinus

//https://www.hackerrank.com/challenges/staircase
// Sample Input
/*
 6
 */

//Sample Output
/*
 #
 ##
 ###
 ####
 #####
 ######
 */

func staircase() {
    // read the integer n
    let n = Int(readLine()!)!
    
    func drawStairLanding(count: Int) {
        var landing: [String] = []
        var staircase: [[String]] = []
        
        for _ in 1...count {
            landing.append("#")
        }
        
        
        staircase.append(landing)
        
        
        func flipStairs()  {
            var landingCopy: [String] = []
            var staircaseCopy: [[String]] = [[]]
            for landing in staircase {
                
                let upperBound = n
                
                landingCopy = addNumberOfSpacesToRightAlign(upperBound - landing.count, landing: landing)
                //
                //                var landingString = landingCopy.joined()
                ////                print("LANDING COPY STRING: \(landingString)")
                //                let char: Character = "a"
                
                
                
                landingCopy.forEach({ (stairLevelString) in
                    
                    print(stairLevelString)
                    //                    print(stairLevelString.padding(toLength: 3, withPad: " ", startingAt: 0))
                    staircaseCopy.append(landingCopy)
                })
                print()
                
            }
            print("LANDING COPY: \(landingCopy.joined())")
        }
        
        flipStairs()
    }
    
    
    func addNumberOfSpacesToRightAlign(_ num: Int, landing: [String]) -> [String] {
        var landingCopy = landing
        if num > 0 {
            for _ in 1...num {
                landingCopy.insert("", at: 0)
            }
        }
        return landingCopy
    }
    // print the staircase
    for i in 1...n {
        drawStairLanding(count: i)
    }
    
    
}
funk["staircase"] = staircase

//https://www.hackerrank.com/challenges/2d-array
// Sample Input
/*
 1 1 1 0 0 0
 0 1 0 0 0 0
 1 1 1 0 0 0
 0 0 2 4 4 0
 0 0 0 2 0 0
 0 0 1 2 4 0
 */

//Sample Output
/*
 19
 */

func twoDimensionalArray() {
    // number of elements
    let n = 6
    
    var rowIncrement = 0
    
    // declare 6x6 2d array
    var arr: [[Int]] = []
    
    var hourglassArr: [[Int]] = []
    
    // read array row-by-row
    for i in 0..<n {
        arr.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
        if i+2 < arr.count - 1 {
            print(arr[rowIncrement][i], arr[rowIncrement][i+1], arr[rowIncrement][i+2])
        }
    }
    
    
    
    
    
    //    for i in 0..<arr.count {
    //        let topArr = [arr[i][i], arr[i][i + 1], arr[i][i + 2]]
    //        let middleArr = [arr[i + 1][i + 1]]
    //        let bottomArr = [arr[i + 2][i], arr[i + 2][i + 1], arr[i + 2][i + 2]]
    //
    //        hourglassArr.append(topArr)
    //        hourglassArr.append(middleArr)
    //        hourglassArr.append(bottomArr)
    //    }
    print(hourglassArr)
}

funk["2dArray"] = twoDimensionalArray

//https://www.hackerrank.com/challenges/time-conversion
//Sample Input:
//07:05:45PM

//Sample Output:
//19:05:45

func timeConversion() {
    //Given 12-hour AM/PM format, convert it to 24-hour format
    
    func convertTo24HourFormat(_ currentHour: Int) -> Int {
        var newHour = 0
        var currentHourCopy = currentHour
        currentHourCopy += 12
        
        newHour = currentHourCopy
        
        return newHour
    }
    
    let time12HourFormat = readLine()!
    
    let timeComponents = time12HourFormat.components(separatedBy: ":")
    
    guard let hourComponent = Int(timeComponents[0]) else {
        print("Error Converting Hour")
        return
    }
    
    guard let minComponent = Int(timeComponents[1]) else {
        print("Error Converting Mins")
        return
    }
    
    let secondsString = timeComponents[2]
    let seconds = secondsString.substring(to: secondsString.index(secondsString.startIndex, offsetBy: 2))
    
    guard let secondsComponent = Int(seconds) else {
        print("Error Converting Seconds")
        return
    }
    
    if hourComponent < 0 || hourComponent > 12 || secondsComponent < 0 || secondsComponent > 59 || minComponent < 0 || minComponent > 59 {
        print("Invalid Time Format. Check and try again")
    }
    
    let new24HourComponent = convertTo24HourFormat(hourComponent)
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US")
    dateFormatter.dateFormat = "HH:mm:ss"
    
    
    
    let components = NSDateComponents()
    components.hour = new24HourComponent
    components.minute = minComponent
    components.second = secondsComponent
    
    
    
    //    print(date)
    
}

funk["timeConversion"] = timeConversion

//https://www.hackerrank.com/challenges/grading?utm_campaign=challenge-recommendation&utm_medium=email&utm_source=3-day-campaign

// Sample Input:
//4 73 67 38 33

// Sample Output:
//75
//67
//40
//33


func gradingStudents() {
    var grades = [Int]()
    
    let gradeCount = Int(readLine()!)!
    for _ in 1...gradeCount {
        let grade = Int(readLine()!)!
        grades.append(grade)
    }
    
    var convertedGrades = [Int]()
    var nextMultipleOfFive = 0
    
    grades.forEach { (grade) in
        if grade > 0 && grade <= 100 {
            let currentMultipleOfFive = grade / 5
            nextMultipleOfFive = currentMultipleOfFive + 1
            
            if grade < 38 {
                convertedGrades.append(grade)
            }
                
            else if ((nextMultipleOfFive * 5) - grade) < 3 {
                
                convertedGrades.append(nextMultipleOfFive * 5)
            } else {
                convertedGrades.append(grade)
            }
        } else {
            return
        }
    }
    convertedGrades.forEach{ (grade) in
        print(grade)
    }
}

funk["gradingStudents"] = gradingStudents

// MARK: Camel Case

//https://www.hackerrank.com/challenges/camelcase

// Sample Input:
//saveChangesInTheEditor

// Sample Output:
//5

func camelCase() {
    let camelString = readLine()!
    
    var wordCount = 0
    
    for char in camelString.characters{
        print(char)
        let charString = String(char)
        if charString.capitalized == charString {
            wordCount += 1
        }
    }
    print(wordCount + 1)
}

funk["camelCase"] = camelCase

//https://www.hackerrank.com/challenges/tutorial-intro

//Sample Input:
//Three lines:
// 1. V - the value that has to be searched
// 2. n - the size of the array
// 3. ar - numbers that make up the array

// Sample Output:
//the index of V in the array


func tutorialIntro() {
    let value = Int(readLine()!)!
    let _ = Int(readLine()!)!
    var arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    var indexForValue = 0
    
    for i in 0..<arr.count {
        if arr[i] == value {
            indexForValue = i
        }
    }
    print(indexForValue)
}

funk["tutorialIntro"] = tutorialIntro

//https://www.hackerrank.com/challenges/insertionsort1?h_r=next-challenge&h_v=zen
// Sample Input:
//5 (arr count)
//2 4 6 8 3 (arr elems)

// Smaple Output:
//2 4 6 8 8
//2 4 6 6 8
//2 4 4 6 8
//2 3 4 6 8

func insertionSort1() {
    let arrCount = Int(readLine()!)!
    var arr = readLine()!.components(separatedBy: " ").map { Int($0)!}
    var arrCopy = arr
    
    var poppedElem = arr.last!
    
    var tempElem = 0
    
    for i in (0..<arrCopy.count).reversed() {
        print(arrCopy[i])
        if arrCopy[i] > poppedElem {
            
        }
    }
    
    
}

funk["insertionSort1"] = insertionSort1


while true {
    print("\nENTER FUNCTION, CHOICES ARE:\n")
    for k in funk.keys {
        print(k)
    }
    print()
    
    if let functionName = readLine(),
        let function = funk[functionName] {
        print("Enter inputs")
        function()
    }
    else {
        print("That's not a valid function")
    }
}



