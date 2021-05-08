//
//  ModelStage.swift
//  WordDungeon
//
//  Created by Teerat Prasitwet on 5/5/21.
//

import Foundation

struct ModelStage {
    private var playerModelList: [PlayerModel] = [
        PlayerModel(imageURL: "Player", HP: 1000, ATK: 100, DEF: 20, CRIT: 15, EVA: 10, isAlive: true),
        PlayerModel(imageURL: "Player", HP: 1000, ATK: 100, DEF: 20, CRIT: 15, EVA: 10, isAlive: true),
        PlayerModel(imageURL: "Player", HP: 1000, ATK: 100, DEF: 20, CRIT: 15, EVA: 10, isAlive: true),
        PlayerModel(imageURL: "Player", HP: 1000, ATK: 100, DEF: 20, CRIT: 15, EVA: 10, isAlive: true),
        PlayerModel(imageURL: "Player", HP: 1000, ATK: 100, DEF: 20, CRIT: 15, EVA: 10, isAlive: true),
        PlayerModel(imageURL: "Player", HP: 1000, ATK: 100, DEF: 20, CRIT: 15, EVA: 10, isAlive: true),
        PlayerModel(imageURL: "Player", HP: 1000, ATK: 100, DEF: 20, CRIT: 15, EVA: 10, isAlive: true)]
    private var monsterModelList: [MonsterModel] = [
        MonsterModel(imageURL: "M01_GreenPoring_Shadow", HP: 5, ATK: 2, DEF: 1, CRIT: 1, EVA: 1, isAlive: true),
        MonsterModel(imageURL: "M02_MudHand_Shadow", HP: 80, ATK: 10, DEF: 1, CRIT: 1, EVA: 1, isAlive: true),
        MonsterModel(imageURL: "M03_LionWhat_Shadow", HP: 100, ATK: 15, DEF: 1, CRIT: 1, EVA: 1, isAlive: true),
        MonsterModel(imageURL: "M04_KidBlueDragon_Shadow", HP: 120, ATK: 20, DEF: 1, CRIT: 1, EVA: 1, isAlive: true),
        MonsterModel(imageURL: "M05_EyeWing_Shadow", HP: 200, ATK: 35, DEF: 15, CRIT: 10, EVA: 15, isAlive: true),
        MonsterModel(imageURL: "M06_PterosaurHerd_Shadow", HP: 120, ATK: 25, DEF: 5, CRIT: 5, EVA: 5, isAlive: true),
        MonsterModel(imageURL: "M07_OctopusDragon_Shadow", HP: 130, ATK: 30, DEF: 10, CRIT: 5, EVA: 5, isAlive: true),
        MonsterModel(imageURL: "M08_BlueInsect_Shadow", HP: 125, ATK: 25, DEF: 1, CRIT: 5, EVA: 15, isAlive: true)
    ]
    var stage: Int
    var playerStage: PlayerModel
    var monsterStage: MonsterModel
    
    init(stage: Int) {
        self.stage = stage
        playerStage = playerModelList[stage/5]
        monsterStage = monsterModelList[stage]
    }
    mutating func upgradePlayerModel(stage: Int, iHP: Int, iATK: Int, iDEF: Int, iCRIT: Int, iEVA: Int) {
        playerModelList[stage/5].HP = iHP
        playerModelList[stage/5].ATK = iATK
        playerModelList[stage/5].DEF = iDEF
        playerModelList[stage/5].CRIT = iCRIT
        playerModelList[stage/5].EVA = iEVA
    }
    mutating func changeMonster(stage: Int) {
        self.stage = stage
        monsterStage = monsterModelList[stage]
    }
    func getPlayerModel() -> PlayerModel {
        return playerStage
    }
    func getPlayerModelList() -> [PlayerModel] {
        return playerModelList
    }
    func getMonsterModel() -> MonsterModel {
        return monsterStage
    }
    func getMonsterPic() -> String {
        return monsterStage.imageURL
    }
    func getHpPlayer() -> Int {
        return playerStage.HP
    }
    func getImgPlayer() -> String {
        return playerStage.imageURL
    }
    func getAtkPlayer() -> Int {
        return playerStage.ATK
    }
    func getDefPlayer() -> Int {
        return playerStage.HP
    }
    func getEvaPlayer() -> Int {
        return playerStage.EVA
    }
    func getCritPlayer() -> Int {
        return playerStage.CRIT
    }
    
    func getHpMonster() -> Int {
        return monsterStage.HP
    }
    func randomAtk(Atk :Int) -> Double {
        let persent = Int.random(in: 100..<121)
        return Double(Atk)*(Double(persent)/100.0)
    }
    func randomPersent(percentage :Int) -> Bool {
        return arc4random_uniform(100) < percentage
    }/*
    mutating func createstateplayer(stage: Int){
        var createplayobj = PlayerModel(id: UUID(), imageURL: getImgPlayer(), HP: getHpPlayer(), ATK: getAtkPlayer(), DEF: getDefPlayer(), CRIT: getCritPlayer(), EVA: getCritPlayer(), isAlive: true)
        playerModelList.append(createplayobj)
    }*/
    mutating func atkToMonster() {
        let atkPlayer = playerStage.ATK
        let critPlayer = playerStage.CRIT
        let hpMonster = monsterStage.HP
        let defMonster = monsterStage.DEF
        let evaMonster = 100-monsterStage.EVA
        if randomPersent(percentage: evaMonster){
            if randomPersent(percentage: critPlayer){
                monsterStage.HP = hpMonster - Int(randomAtk(Atk: atkPlayer)*((100.0 - Double(defMonster))/100.0))*2
            }
            else{
                monsterStage.HP = hpMonster - Int(randomAtk(Atk: atkPlayer)*((100.0 - Double(defMonster))/100.0))
            }
            if monsterStage.HP <= 0{
                monsterStage.isAlive = false
            }
        }
    }
    mutating func atkToPlayer() {
        let atkMonster = monsterStage.ATK
        let critMonster = monsterStage.CRIT
        let hpPlayer = playerStage.HP
        let defPlayer = playerStage.DEF
        let evaPlayer = 100-playerStage.EVA
        if randomPersent(percentage: evaPlayer){
            print(randomPersent(percentage: evaPlayer))
            if randomPersent(percentage: critMonster){
                playerStage.HP = hpPlayer - Int(randomAtk(Atk: atkMonster)*((100.0 - Double(defPlayer))/100.0))*2
            }
            else{
                playerStage.HP = hpPlayer - Int(randomAtk(Atk: atkMonster)*((100.0 - Double(defPlayer))/100.0))
            }
            if playerStage.HP <= 0{
                playerStage.isAlive = false
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
    var isAlive: Bool
}

struct MonsterModel: Identifiable {
    var id = UUID()
    var imageURL: String
    var HP: Int
    var ATK: Int
    var DEF: Int
    var CRIT: Int
    var EVA: Int
    var isAlive: Bool
}
