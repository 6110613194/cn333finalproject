//
//  SwiftUIView.swift
//  Word Dungeon
//
//  Created by Phurinat on 6/5/2564 BE.
//
import Foundation
import SwiftUI


struct StatusGameView: View {
    @Binding var showingGame: String
    var body: some View {
        
        Text("Upgrade Your Status")
        Button(action:{
            showingGame = "play"
        }){
            Image("CONTINUE")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 60)
        }
        Button(action:{
            showingGame = ""
        }){
            Image("EXIT")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 60)
        }
        
    }
}

struct StatusGameView_Previews: PreviewProvider {
    static var previews: some View {
        StatusGameView(showingGame: .constant("status"))
    }
}
