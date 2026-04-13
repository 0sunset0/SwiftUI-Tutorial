//
//  _8__FriendsFavoriteMoviesApp.swift
//  08. FriendsFavoriteMovies
//
//  Created by 노을 on 4/12/26.
//

import SwiftUI
import SwiftData

@main
struct _8__FriendsFavoriteMoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Friend.self, Movie.self])
    }
}
