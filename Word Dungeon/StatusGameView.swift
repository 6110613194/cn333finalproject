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
        VStack {
            Image("StatusUpgradeLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 380, height: 380)
            Spacer()
            HStack {
                Image("Player")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                VStack {
                    HStack {
                        
                    }
                }
            }
        }
        
    }
}

/*struct StatusGameView_Previews: PreviewProvider {
    static var previews: some View {
        StatusGameView(showingGame: .constant("status"))
    }
}*/
