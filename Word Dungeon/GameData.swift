//
//  GameData.swift
//  WordDungeon
//
//  Created by Teerat Prasitwet on 5/2/21.
//

import Foundation

class GameData: ObservableObject {
    private var stage = 0
    @Published var vocabularyStage = VocabularyStage(stage: 0)
    private var showVocabCard: [String] = []
    @Published var alphabet = Alphabet()
    
    func vocabAnswerList() -> [String] {
        let vocabLine = vocabularyStage.vocabStageList
        return vocabLine
    }
    
    func stageChanger() {
        self.stage = self.stage + 1
        vocabularyStage = VocabularyStage(stage: stage)
    }
    
    func checkAnswer(onTap: String)-> Bool{
        var check: Bool = false
        for CharObj in vocabularyStage.getCharList() {
            if onTap == CharObj.content {
                check = true
            }
        }
        return check
    }
    func setAlphaShow(onTap: String){
        var i = 0
        for AlphaObj in alphabet.getAlphabetList() {
            
            if onTap == AlphaObj.content {
                alphabet.setShowAlpha(index: i, set: false)
            }
            i += 1
        }
    }
    func setAnswerShow(onTap: String){
        var i = 0
        for CharObj in vocabularyStage.getCharList() {
            
            if onTap == CharObj.content {
                vocabularyStage.setShowChar(index: i,set: true)
            }
            i += 1
        }
    }
    
    func createAnswerCard() {
        
    }
    
}

