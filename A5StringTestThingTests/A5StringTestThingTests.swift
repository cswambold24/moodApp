//
//  A5StringTestThingTests.swift
//  A5StringTestThingTests
//
//  Created by Carver Wambold24 on 1/24/24.
//

import XCTest
import Foundation
@testable import A5StringTestThing

final class A5StringTestThingTests: XCTestCase {
    var viewmodel = ViewModel()
    func testEnsureLowercase() throws {
        let output = viewmodel.tokenizePhrase("PlS SepArate ME pLS")
         XCTAssertEqual(output, ["pls", "separate", "me", "pls"])
    }
    func testNoSpace() throws {
        let output = viewmodel.tokenizePhrase("   pls   separate   me   pls        ")
         XCTAssertEqual(output, ["pls", "separate", "me", "pls"])
    }
    func testEnsureOneWord() throws {
        let output = viewmodel.tokenizePhrase("PlSSepArateMEpLS")
         XCTAssertEqual(output, ["plsseparatemepls"])
    }
    func testPunctuation() throws {
        let output = viewmodel.tokenizePhrase("pls separate me, pls!!!")
         XCTAssertEqual(output, ["pls", "separate", "me", "pls"])
    }
    func testTokenAmount1() throws {
       
        let output = viewmodel.tokenizePhrase("pls separate me pls")
        XCTAssertEqual(output?.count, 4)
    }
    
    
    
    
    
    
    func testKeywordAppearsOnce() {
        let output = viewmodel.countOccurences(["pls", "count", "me", "pls"], "count")
        XCTAssertEqual(output, 1)
    }
    func testKeywordAppearsMultiple() {
        let output = viewmodel.countOccurences(["pls", "count", "me", "pls"], "pls")
        XCTAssertEqual(output, 2)
    }
    func testKeywordAppearsNone() {
        let output = viewmodel.countOccurences(["pls", "count", "me", "pls"], "carver")
        XCTAssertEqual(output, 0)
    }
    func testKeywordAppearsInside() {
        let output = viewmodel.countOccurences(["pls", "count", "me", "pls"], "co")
        XCTAssertEqual(output, 0)
    }
    func testNoInput() {
        let output = viewmodel.countOccurences([], "")
        XCTAssertEqual(output, 0)
    }
    
    
    
    
//    func testCorrectOccurences() {
//        let output = viewmodel.analyzeTextKeywords(["dont", "number", "this", "dont", "number", "this", "dont"], ["pls", "count", "me"])
//        XCTAssertEqual(output, [0, 0, 0])
//    }
//    func testNoOccurences() {
//        let output = viewmodel.analyzeTextKeywords(["pls", "count", "me", "pls", "count", "me", "pls"], ["pls", "count", "me"])
//        XCTAssertEqual(output, [3, 2, 2])
//    }
//    func testNoText() {
//        let output = viewmodel.analyzeTextKeywords([], ["pls", "count", "me"])
//        XCTAssertEqual(output, [0, 0, 0])
//    }
//    func testNoKeywords() {
//        let output = viewmodel.analyzeTextKeywords(["pls", "count", "me", "pls", "count", "me", "pls"], [])
//        XCTAssertEqual(output, [])
//    }
//    
//    
//    func testCorrectOutput() {
//        let output = viewmodel.computeTextWeight(counts: [2, 1, 3], weights: [5, 10, 2])
//        XCTAssertEqual(output, 26)
//    }
//    func testNoEntry() {
//        let output = viewmodel.computeTextWeight(counts: [], weights: [])
//        XCTAssertEqual(output, 0)
//    }
//    func testUnequalEntry() {
//        let output = viewmodel.computeTextWeight(counts: [], weights: [1])
//        XCTAssertEqual(output, 0)
//    }
//    
    
    
    func testOne() {
        let output = viewmodel.categorizeValue(value: -22)
        XCTAssertEqual(output, "Strongly Negative")
    }
    func testTwo() {
        let output = viewmodel.categorizeValue(value: -3)
        XCTAssertEqual(output, "Negative")
    }
    func testThree() {
        let output = viewmodel.categorizeValue(value: 0)
        XCTAssertEqual(output, "Neutral")
    }
    func testFour() {
        let output = viewmodel.categorizeValue(value: 4)
        XCTAssertEqual(output, "Positive")
    }
    func testFive() {
        let output = viewmodel.categorizeValue(value: 22)
        XCTAssertEqual(output, "Strongly Positive")
    }
}
