//
//  ContentView.swift
//  Word Dungeon
//
//  Created by Phurinat on 1/5/2564 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var showingGame : String = ""
    @State var stage = 0
    var body: some View {
        if showingGame == "play" {
            MainGameView(showingGame: $showingGame)
        }else if showingGame == "status"{
            StatusGameView(showingGame: $showingGame)
        }
        else if showingGame == "pause"{
            PauseGameView(showingGame: $showingGame)
        }
        else {
            HomeScreenView(showingGame: $showingGame)
        }
    }
}


/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
