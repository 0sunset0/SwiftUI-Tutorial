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
