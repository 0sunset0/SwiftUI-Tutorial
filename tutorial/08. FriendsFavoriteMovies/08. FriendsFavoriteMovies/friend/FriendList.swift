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
    @State private var newFriend: Friend?
    
    var body: some View {
        NavigationSplitView {
            /**
             Group은 여러 뷰를 하나로 묶어서 modifier를 중복 없이 한 번만 적용하기 위해 사용합니다.
             */
            Group {
                if !friends.isEmpty {
                    List {
                        ForEach(friends) { friend in
                            NavigationLink(friend.name){
                                FriendDetail(friend: friend)
                            }
                        }
                        /**
                         스와이프하여 한 번에 Friend를 삭제
                         */
                        .onDelete(perform: deleteFriends(indexes:))
                    }
                } else {
                    //콘텐츠가 없거나 비어있을 때 보여주는 전용 안내 화면
                    ContentUnavailableView("Add Frined", systemImage: "person.and.person")
                }
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem{
                    Button("Add friend", systemImage: "plus", action: addFriend)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            /**
             $newFriend가 nil이 아니면 sheet가 띄워짐
             */
            .sheet(item: $newFriend) { friend in
                NavigationStack {
                    FriendDetail(friend: friend, isNew: true)
                }
                .interactiveDismissDisabled()
            }
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
    
    private func addFriend() {
        let newFriend = Friend(name: "")
        context.insert(newFriend)
        self.newFriend = newFriend
    }
    
    private func deleteFriends(indexes: IndexSet) {
        for index in indexes {
            context.delete(friends[index])
        }
    }
}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("Empty List") {
    FriendList()
        .modelContainer(for: Friend.self, inMemory: true)
}
