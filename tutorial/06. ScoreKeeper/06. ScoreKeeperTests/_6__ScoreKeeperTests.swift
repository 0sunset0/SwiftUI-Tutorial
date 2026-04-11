//
//  _6__ScoreKeeperTests.swift
//  06. ScoreKeeperTests
//
//  Created by 노을 on 4/11/26.
//

import Testing
@testable import _6__ScoreKeeper

struct _6__ScoreKeeperTests {
    
    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0),
            Player(name: "Andre", score: 5),
        ])
        scoreboard.resetScores(to: newValue)


        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }
    
    @Test("Highest score wins")

    func highestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 4),
            ],
            state: .gameOver,
            doesHighestScoreWin: true
        )
         let winners = scoreboard.winners
        /**
         expect로 비교하려면, Equatable 프로토콜을 준수해야 한다.
         */
        #expect(winners == [Player(name: "Andre", score: 4)])
    }
    
    @Test("Lowest score wins")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 4),
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
         let winners = scoreboard.winners
        #expect(winners == [Player(name: "Elisha", score: 0)])
    }
}
