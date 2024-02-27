//
//  InitViewModel.swift
//  A5StringTestThing
//
//  Created by Carver Wambold24 on 2/14/24.
//

import Foundation

func initWord(_ keywords : [String], _ values: [Int]) -> [Word] {
    var words: [Word] = []
    for i in 0...keywords.count-1 {
        words.append(Word(keyword: keywords[i], value: values[i]))
    }
    return words
}
