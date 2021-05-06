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
                        print("")
                    }){
                        Image("MENU")
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
                    .position(x: geometry.size.width-70, y: 75)
                    HStack {
                        VStack {
                            Image("HP")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Image("Player2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 160, height: 160)
                        }
                        Spacer()
                        VStack {
                            Image("HP")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Image("M01_GreenPoring")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 180, height: 180)
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
                                        gameData.setAnswerShow(onTap: obj.content)
                                        if gameData.checkAnswer(onTap: obj.content){
                                            gameData.setAlphaShow(onTap: obj.content)
                                        }else{
                                            print("อิไตโย")
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
struct MainGameView_Previews: PreviewProvider {
    static var previews: some View {
        MainGameView()
    }
}
