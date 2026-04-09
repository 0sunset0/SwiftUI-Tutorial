//
//  ContentView.swift
//  06. ScoreKeeper
//
//  Created by 노을 on 4/9/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Kepper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)
                
                ForEach($players) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                    
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
