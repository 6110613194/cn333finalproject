//
//  HomeScreenView.swift
//  WordDungeon
//
//  Created by Teerat Prasitwet on 5/1/21.
//

import Foundation
import SwiftUI

struct HomeScreenView: View {
    @Binding var showingGame: Bool
    
    var body: some View {
        VStack {
            Image("WordDungeonLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 380, height: 380)
            Button(action:{
                showingGame.toggle()
            }){
                Image("NEW GAME")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 60)
            }
            Button(action:{
                print("Continue")
            }){
                Image("CONTINUE")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 60)
            }
            Button(action:{
                print("exit")
            }){
                Image("EXIT")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 60)
            }
        }
        .background(Image("BR01")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all))
    }
}

