//
//  Player.swift
//  06. ScoreKeeper
//
//  Created by 노을 on 4/9/26.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    var name: String
    var score: Int
}
/**
 Equatable를 준수하면, Swift는 해당 타입의 모든 속성을 비교하고 같으면 true를 반환하는 구현체를 자동으로 제공합니다.
 */
extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }

}
