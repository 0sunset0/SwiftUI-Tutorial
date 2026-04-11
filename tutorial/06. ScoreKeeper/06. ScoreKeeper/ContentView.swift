//
//  ContentView.swift
//  06. ScoreKeeper
//
//  Created by 노을 on 4/9/26.
//

import SwiftUI

struct ContentView: View {
    @State var scoreBoard: Scoreboard = Scoreboard()
    @State var startingPoints = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Kepper")
                .font(.title)
                .bold()
                .padding(.bottom)

            SettingsView(doesHighestScoreWin: $scoreBoard.doesHighestScoreWin, startingPoints: $startingPoints)
                .disabled(scoreBoard.state != .setup)
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                        .opacity(scoreBoard.state == .setup ? 0 : 1.0)
                }
                .font(.headline)
                
                ForEach($scoreBoard.players) { $player in
                    GridRow {
                        HStack {
                            if scoreBoard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(Color.yellow)
                            }
                            TextField("Name", text: $player.name)
                        }
                        Text("\(player.score)")
                            .opacity(scoreBoard.state == .setup ? 0 : 1.0)
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                            .opacity(scoreBoard.state == .setup ? 0 : 1.0)
                    }
                    
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                scoreBoard.players.append(Player(name: "", score: 0))
            }
            .opacity(scoreBoard.state == .setup ? 1.0 : 0)
            
            Spacer()
            
            HStack {
                Spacer()
                switch scoreBoard.state {
                case .setup :
                    Button("Start Game", systemImage: "play.fill") {
                        scoreBoard.state = .playing
                        scoreBoard.resetScores(to: startingPoints)
                    }
                case .playing :
                    Button("End Game", systemImage: "stop.fill") {
                        scoreBoard.state = .gameOver
                    }
                case .gameOver :
                    Button("New Game", systemImage: "arrow.2.circlepath.circle") {
                        scoreBoard.state = .setup
                    }
                }
                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)
            
            
        }.padding()
    }
}

#Preview {
    ContentView()
}
