//
//  FriendList.swift
//  08. FriendsFavoriteMovies
//
//  Created by 노을 on 4/12/26.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    @Query(sort: \Friend.name) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(friends) { friend in
                    NavigationLink(friend.name){
                        Text("Detail view for \(friend.name)")
                            .navigationTitle("Friend")
                            .navigationBarTitleDisplayMode(.inline)
                    }

                }
            }
            .navigationTitle("Friends")
        }
        /**
         기본 상세 보기 화면
         */
        detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
        }

    }
}

#Preview {
    FriendList()
        .modelContainer(SampleDate.shared.modelContainer)
}
