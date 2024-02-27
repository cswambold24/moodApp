//
//  ViewModel.swift
//  A5StringTestThing
//
//  Created by Carver Wambold24 on 1/24/24.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    var words = initWord(keywords, values)
    let phrases: [String: [String]] = [
            "Strongly Positive": [
                "You're vibing high and inspiring others to reach for their best selves. Keep shining, your energy is magnetic!",
                "Your positivity is like a superpower, transforming challenges into opportunities. Keep this flow going!",
                "Like the brightest star in the night sky, your positivity lights the way for yourself and others. Shine on!",
                "Your energy is a beacon of hope and inspiration. Continue to spread your light wherever you go.",
                "The universe celebrates your radiant spirit. Keep harnessing this positive energy to uplift those around you."
            ],
            "Positive": [
                "You've got that glow of someone who's found their flow. Keep riding this wave of positivity and see where it takes you.",
                "Your positive mindset is your ticket to every adventure. Stay open, stay curious, and watch the universe align for you.",
                "Every step forward is a step towards your dreams. Keep moving with this positive momentum!",
                "Positivity is your superpower, turning everyday moments into magic. Keep weaving this magic into your life.",
                "The seeds of positivity you plant today will bloom into tomorrow's joys. Keep nurturing your garden of positivity."
            ],
            "Neutral": [
                "Embracing the pause between the highs and lows is where growth happens. You're exactly where you need to be.",
                "Neutral is the new starting line. From here, you can sprint or stroll into your next chapter with clarity and purpose.",
                "In stillness, we find our strength. Your calm center is a powerful force for navigating life's ups and downs.",
                "Balance is not something you find; it's something you create. Your equilibrium is a testament to your wisdom.",
                "The beauty of neutrality is in its potential. What wonderful path will you choose from this balanced place?"
            ],
            "Negative": [
                "It's okay to not be okay. Honor your feelings, breathe through them, and remember, you're stronger than your toughest day.",
                "Turn your challenges into your teachers. Each breath is a new beginning, a chance to reset and rise again.",
                "Dark clouds may hover, but they bring the rain that nourishes growth. Embrace the growth, even when it's hard.",
                "Remember, it's during our struggles that we often grow the most. You are being shaped into something even more amazing.",
                "Feelings are like waves: they come and go. Let yourself feel, but don't forget, brighter days are on the horizon."
            ],
            "Strongly Negative": [
                "In the shadows, we find our inner light. Trust the process, lean into self-care, and watch yourself emerge stronger.",
                "Life's toughest storms prove the strength of our anchors. Hold fast to your inner calm; this too shall pass, leaving you more grounded than ever.",
                "Even in the darkest moments, your spirit's light can shine through. Find that light within, it will guide you home.",
                "Your resilience in the face of adversity is your true strength. This challenge is but a chapter in your epic story.",
                "Pain and struggle are part of the journey, but they are not the entire story. Keep turning the pages, a new chapter awaits."
            ]
        ]
    
    
    
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
    
    
    
    func analyzeTextKeywordsOriginal(_ text: [String], _ keywords: [String]) -> [Int] {
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
    func analyzeTextKeywords(_ text: [String], _ keywords: [Word]) -> [Int] {
        if text != [""] {
            var counts: [Int] = []
            print(keywords.count-1)
            for i in 0...keywords.count-1 {
                var count: Int = 0
                for j in 0...text.count-1 {
                    if text[j] == keywords[i].keyword.lowercased() {
                        count+=1
                    }}
                
                counts.append(count)
            }
            return counts
        } else { print("nothing was entered") ; return [] }
    }
    
    func computeTextWeight(counts: [Int], weights: [Word]) -> Int? {
        if counts.count == 0 {
            return 0
        } else if counts.count == weights.count {
            
            var total = 0
            for i in 0...counts.count-1 {
                let x = counts[i] * weights[i].value
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
    func pickPhrase(input: String) -> String{
        let output = (phrases[input])![Int.random(in: 0..<5)]
        return output
    }
    
    func analyzeMood (input: String) -> [String] {
        
        //first seperate text
        
        let seperatedInput = tokenizePhrase(input)
        // next anyalize the keywords to see how often they occur
        let keywordCount = analyzeTextKeywords(seperatedInput!, words)
        //next compute the weight
        let computedWeight = computeTextWeight(counts: keywordCount, weights: words)
        //next next get an output
        var output = [categorizeValue(value: computedWeight ?? 0 ) ?? "soemthigns wrogn"]
        output.append(pickPhrase(input: output[0]))
        print(computedWeight!)
        
        return output
    }
}
