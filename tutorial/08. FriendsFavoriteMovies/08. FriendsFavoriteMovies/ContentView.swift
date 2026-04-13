//
//  ContentView.swift
//  08. FriendsFavoriteMovies
//
//  Created by 노을 on 4/12/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                Tab("Friends", systemImage: "person.and.person") {
                    FriendList()
                }
                
                Tab("Movies", systemImage: "film.stack") {
                    MovieList()
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
