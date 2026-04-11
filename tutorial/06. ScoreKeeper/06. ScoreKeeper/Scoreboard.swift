//
//  Scoreboard.swift
//  06. ScoreKeeper
//
//  Created by 노을 on 4/11/26.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0),
    ]
    
    var state = GameState.setup
    
    var doesHighestScoreWin = true
    
    var winners: [Player] {
        guard case .gameOver = state else { return [] }
        
        var winningScore = 0
        if doesHighestScoreWin {
            var winningScore = Int.min
            for player in players {
                winningScore = max(winningScore, player.score)
            }
        } else {
            var winningScore = Int.max
            for player in players {
                winningScore = min(winningScore, player.score)
            }
            
        }

        return players.filter { player in
            player.score == winningScore
        }
    }
    
    /**
     mutating func는 Swift에서 struct나 enum 안에 있는 함수가 자신의 프로퍼티를 변경할 수 있도록 허용하는 키워드예요.
     Swift에서 struct는 기본적으로 값 타입(value type)이라 내부 값을 바꿀 수 없어요. mutating을 붙여야 변경이 가능해집니다.
     class는 필요 없음
     */
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
