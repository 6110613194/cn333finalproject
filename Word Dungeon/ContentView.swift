//
//  ContentView.swift
//  Word Dungeon
//
//  Created by Phurinat on 1/5/2564 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var showingGame = false
    
    var body: some View {
        if showingGame {
            MainGameView()
        } else {
            HomeScreenView(showingGame: $showingGame)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
