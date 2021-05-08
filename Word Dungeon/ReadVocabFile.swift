//
//  ReadVocabFile.swift
//  Word Dungeon
//
//  Created by Cheunchanok Phewkleang on 12/5/2564 BE.
//

import Foundation
class ReadVocabFile {
    var allWords = [String]()
    func readtext(){
        if let startWordsURL = Bundle.main.url(forResource: "vocab", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
    }
}
