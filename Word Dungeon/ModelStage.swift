//
//  ModelStage.swift
//  WordDungeon
//
//  Created by Teerat Prasitwet on 5/5/21.
//

import Foundation

struct ModelStage {
    private var playerModel: PlayerModel
    private var monsterModelList: [MonsterModel] = [
        MonsterModel(imageURL: "M01_GreenPoring", HP: 5, ATK: 5, DEF: 1, CRIT: 1, EVA: 1,istrue:true),
        MonsterModel(imageURL: "M02_MudHand", HP: 80, ATK: 10, DEF: 1, CRIT: 1, EVA: 1,istrue:true),
        MonsterModel(imageURL: "M03_LionWhat", HP: 150, ATK: 15, DEF: 1, CRIT: 1, EVA: 1,istrue:true),
        MonsterModel(imageURL: "M04_KidBlueDragon", HP: 200, ATK: 20, DEF: 1, CRIT: 1, EVA: 1,istrue:true),
        MonsterModel(imageURL: "M05_EyeWing", HP: 300, ATK: 35, DEF: 20, CRIT: 15, EVA: 20,istrue:true),
        MonsterModel(imageURL: "M06_PterosaurHerd", HP: 250, ATK: 25, DEF: 10, CRIT: 10, EVA: 10,istrue:true)
    ]
    var stage: Int
    var monsterStage: MonsterModel
    
    init(stage: Int) {
        self.stage = stage
        playerModel = PlayerModel(imageURL: "Player2", HP: 1000, ATK: 100, DEF: 20, CRIT: 15, EVA: 10,istrue:true)
        monsterStage = monsterModelList[stage]
    }
    
    mutating func changeMonster(stage: Int) {
        self.stage = stage
        monsterStage = monsterModelList[stage]
    }
    func getPlayerModel() -> PlayerModel {
        return playerModel
    }
    func getmonsterModel(stage:Int) -> MonsterModel {
        return monsterModelList[stage]
    }
    func getHpPlayer() -> Int {
        return playerModel.HP
    }
    func getHpMonster(stage: Int) -> Int {
        return monsterModelList[stage].HP
    }
    func randomAtk(Atk :Int) -> Double {
        let persent = Int.random(in: 100..<121)
        return Double(Atk)*(Double(persent)/100.0)
    }
    func randomPersent(percentage :Int) -> Bool {
        return arc4random_uniform(100) < percentage
    }
    mutating func atkToMonster(stage: Int) {
        let atkplayer = playerModel.ATK
        let critplayer = playerModel.CRIT
        let hpMonster = monsterModelList[stage].HP
        let defMonster = monsterModelList[stage].DEF
        let evaMonster = 100-monsterModelList[stage].EVA
        if randomPersent(percentage: evaMonster){
            if randomPersent(percentage: critplayer){
                monsterModelList[stage].HP = hpMonster - Int(randomAtk(Atk: atkplayer)*((100.0 - Double(defMonster))/100.0))*2
            }
            else{
                monsterModelList[stage].HP = hpMonster - Int(randomAtk(Atk: atkplayer)*((100.0 - Double(defMonster))/100.0))
            }
            if monsterModelList[stage].HP <= 0{
                monsterModelList[stage].istrue = false
            }
        }
    }
    mutating func atkToplayer(stage: Int) {
        let atkMonster = monsterModelList[stage].ATK
        let critMonster = monsterModelList[stage].CRIT
        let hpPlayer = playerModel.HP
        let defPlayer = playerModel.DEF
        let evaPlayer = 100-playerModel.EVA
        if randomPersent(percentage: evaPlayer){
            print(randomPersent(percentage: evaPlayer))
            if randomPersent(percentage: critMonster){
                playerModel.HP = hpPlayer - Int(randomAtk(Atk: atkMonster)*((100.0 - Double(defPlayer))/100.0))*2
            }
            else{
                playerModel.HP = hpPlayer - Int(randomAtk(Atk: atkMonster)*((100.0 - Double(defPlayer))/100.0))
            }
            if playerModel.HP <= 0{
                playerModel.istrue = false
            }
        }
    }
    
}

struct PlayerModel: Identifiable {
    var id = UUID()
    var imageURL: String
    var HP: Int
    var ATK: Int
    var DEF: Int
    var CRIT: Int
    var EVA: Int
    var istrue: Bool
}

struct MonsterModel: Identifiable {
    var id = UUID()
    var imageURL: String
    var HP: Int
    var ATK: Int
    var DEF: Int
    var CRIT: Int
    var EVA: Int
    var istrue: Bool
}
