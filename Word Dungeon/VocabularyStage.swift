//
//  VocabularyStage.swift
//  WordDungeon
//
//  Created by Teerat Prasitwet on 5/2/21.
//

import Foundation

struct VocabularyStage{
    private let vocabularyList = [["DISADVANTAGE"],["CAT","DOG","ANT"],["BIRD","KING","GANK"]]
    var stage: Int
    var vocabStageList: [String] = []
    var vocabStageShow: [String] = []
    var vocabAnswer = ""
    private var CharacterList: [CharacterObj] = []
    
    init(stage: Int){
        self.stage = stage
        vocabAnswer = vocabularyList[stage].shuffled()[0]
        vocabStageList = vocabAnswer.map{
            String($0)
        }
        for i in vocabStageList {
            vocabStageShow.append(i)
            CharacterList.append(CharacterObj(id: UUID(), content: i, istrue: false))
        }
    }
    func getCharList() -> [CharacterObj] {
        return CharacterList
    }
    mutating func setShowChar(index:Int,set :Bool){
        CharacterList[index].istrue = set
    }
}
struct CharacterObj: Identifiable {
    var id : UUID
    var content : String
    var istrue : Bool
}
