//
//  Alphabet.swift
//  Word Dungeon
//
//  Created by Phurinat on 6/5/2564 BE.
//

import Foundation

struct Alphabet {
    private let alphabetList = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    private var alphabetListObj : [AlphabetObj] = []
    
    init() {
        for char in alphabetList {
            alphabetListObj.append(AlphabetObj(id: UUID(), content: char, istrue: true))
        }
    }
    
    func getAlphabetList() -> [AlphabetObj] {
        return alphabetListObj
    }
    mutating func setShowAlpha(index:Int,set :Bool) {
        alphabetListObj[index].istrue = false
    }
}


struct AlphabetObj : Identifiable {
    var id : UUID
    var content : String
    var istrue : Bool
}
