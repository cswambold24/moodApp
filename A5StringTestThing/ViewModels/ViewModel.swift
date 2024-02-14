//
//  ViewModel.swift
//  A5StringTestThing
//
//  Created by Carver Wambold24 on 1/24/24.
//

import Foundation

func tokenizePhrase(_ text: String) -> [String]? {
    if text != "" {
        let rawOutput = text.split(separator: " ", omittingEmptySubsequences: true)
        var output: [String] = []
        for i in rawOutput {
            let rawString = String(i)
            let string = rawString.filter { $0.isLetter }
            output.append(string.lowercased())
        }
        
        print(output)
        return output
    } else { print("Must enter string!") ; return [] }
}



func countOccurences(_ text: [String], _ keyword: String) -> Int? {
    if text != [""] && keyword != "" {
        var keywordCount = 0
        for word in text {
            if word == keyword {
                keywordCount+=1
            }
        }
        return keywordCount
    } else { print("You have to enter something") ; return 0 }
}



func analyzeTextKeywords(_ text: [String], _ keywords: [String]) -> [Int] {
    if text != [""] && keywords != [""] {
        var counts: [Int] = []
        for keyword in keywords {
            var count: Int = 0
            for word in text {
                if word == keyword {
                    count+=1
                }}
            
            counts.append(count)
        }
        return counts
    } else { print("nothing was entered") ; return [] }
}

func computeTextWeight(counts: [Int], weights: [Int]) -> Int? {
    if counts.count == 0 {
        return 0
    } else if counts.count == weights.count {
        
        var total = 0
        for i in 0...counts.count-1 {
            var x = counts[i] * weights[i]
            total = total + x
            
        }
        return total
    } else { print("You must enter the same number in each array") ; return 0}
}

func categorizeValue(value: Int) -> String? {
    if value <= -15 {
       return "Strongly Negative"
    } else if value <= -2 {
        return "Negative"
    } else if value <= 1 {
        return "Neutral"
    } else if value <= 14 {
        return "Positive"
    } else { return "Strongly Positive"}
    
}
