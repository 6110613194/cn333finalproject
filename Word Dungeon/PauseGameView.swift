//
//  PauseGameView.swift
//  WordDungeon
//
//  Created by Teerat Prasitwet on 5/5/21.
//

import Foundation
import SwiftUI

struct PauseGameView: View {
    @Binding var showingGame: String
    @State var stage = 0
    
    var body: some View {
        VStack {
            Button(action:{
                showingGame = "play"
            }){
                Image("RESUME")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 60)
            }
            .padding()
            Button(action:{
                showingGame = ""
            }){
                Image("MAIN_MANU")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 60)
            }
        }
        .background(Image("BR02")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all))
        
    }
}

/*struct PauseGameView_Previews: PreviewProvider {
    static var previews: some View {
        PauseGameView(showingGame: .constant("pause"))
    }
}*/
