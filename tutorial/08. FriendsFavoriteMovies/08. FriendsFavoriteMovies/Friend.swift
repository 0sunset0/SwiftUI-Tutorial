//
//  Friend.swift
//  08. FriendsFavoriteMovies
//
//  Created by 노을 on 4/12/26.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Jin"),
        Friend(name: "Jin-woo"),
        Friend(name: "Jin-hyeok"),
        Friend(name: "Jin-hyuck"),
    ]

}
