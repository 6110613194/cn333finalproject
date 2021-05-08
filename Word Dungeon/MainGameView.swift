//
//  MainGameView.swift
//  WordDungeon
//
//  Created by Teerat Prasitwet on 5/1/21.
//

import Foundation
import SwiftUI

struct MainGameView: View {
    @ObservedObject var gameData = GameData()
    @State var stage = 0
    @Binding var showingGame: String
    
    let gridcolumn = [GridItem(.flexible()),
                      GridItem(.flexible()),
                      GridItem(.flexible()),
                      GridItem(.flexible()),
                      GridItem(.flexible()),
                      GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack { //HalfTop
                    Button (action: {
                        showingGame = "pause"
                    }){
                        Image("MENU")
                            .resizable()
                            .frame(width: 70, height: 70)
                    }
                    .position(x: geometry.size.width-50, y: 75)
                    HStack {
                        VStack {
                            HStack{
                                Image("HP")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                Text("HP : \(gameData.modelStage.getHpPlayer())").font(.title).bold().italic()
                            }
                            if gameData.modelStage.getPlayerModel().isAlive{
                                Image("Player2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 160, height: 160)
                            }
                            else{
                                Image("")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 160, height: 160)
                            }
                        }
                        Spacer()
                        VStack {
                            HStack{
                                Text("HP : \(gameData.modelStage.getHpMonster())").font(.title).bold().italic()
                                Image("HP")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            if gameData.modelStage.getMonsterModel().isAlive{
                                Image(gameData.modelStage.getMonsterPic())
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 160, height: 160)
                            }
                            else{
                                Image("")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 160, height: 160)
                            }
                            
                        }
                    }
                    
                }
                .frame(width : geometry.size.width, height: geometry.size.height/2)
                .background(Image("BC04")
                                .resizable()
                                .scaledToFill())
                VStack { //HalfBottom
                    Spacer().frame(width: geometry.size.width, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    HStack {
                        ForEach(gameData.vocabularyStage.getCharList()){ charObj in
                            if charObj.istrue {
                                Text(charObj.content)
                                    .font(.title)
                                    .frame(width:25, height: 50)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10).fill(Color.white)
                                    )
                                    .aspectRatio(contentMode: .fit)
                            } else {
                                Text("")
                                    .font(.title)
                                    .frame(width:25, height: 50)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10).fill(Color.white)
                                    )
                                    .aspectRatio(contentMode: .fit)
                                
                            }
                        }
                    }.frame(width : geometry.size.width)
                    Spacer().frame(width: geometry.size.width, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    HStack{
                        LazyVGrid(columns: gridcolumn) {
                            ForEach(gameData.alphabet.getAlphabetList()){obj in
                                if obj.istrue{
                                    Button(action: {
                                        if gameData.checkAnswer(onTap: obj.content){ //vocab is true
                                            gameData.setAnswerShow(onTap: obj.content) //show Answer
                                            gameData.setAlphaShow(onTap: obj.content) //close Alpha
                                            if gameData.vocabularyStage.isComplete(){
                                                gameData.modelStage.atkToMonster()
                                                if gameData.modelStage.monsterStage.isAlive {
                                                    gameData.stageNewVocab()
                                                }
                                            }
                                        }else{
                                            gameData.modelStage.atkToPlayer()
                                        }
                                    }){
                                        Image(obj.content)
                                            .resizable()
                                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)}
                                }else{
                                    Image("AlphabetPick")
                                        .resizable()
                                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                                
                            }
                        }
                        
                    }
                    HStack{
                        if gameData.modelStage.getMonsterModel().isAlive{
                            Image("")
                                .resizable()
                                .frame(width: 150, height: 75, alignment: .center)
                        }
                        else{
                            Button(action:{
                                gameData.stageChanger()
                                //showingGame = "status"
                            }) {
                                Image("CONTINUE")
                                    .resizable()
                                    .frame(width: 150, height: 75, alignment: .center)
                            }
                        }
                        
                    }
                    
                    
                }
                .frame(width : geometry.size.width,height: geometry.size.height/2)
                .background(Image("BC02")
                                .resizable()
                                .scaledToFill())
            }.frame(width : geometry.size.width,height: geometry.size.height)
            
        }.edgesIgnoringSafeArea(.all)
    }
}

/*struct AlphabetButton: View {
 
 }*/
/*struct MainGameView_Previews: PreviewProvider {
    static var previews: some View {
        MainGameView(showingGame: .constant("play"))
    }
}*/
