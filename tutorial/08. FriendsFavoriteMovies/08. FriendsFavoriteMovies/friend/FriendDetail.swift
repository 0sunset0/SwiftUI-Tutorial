//
//  FriendDetail.swift
//  08. FriendsFavoriteMovies
//
//  Created by 노을 on 4/13/26.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    /**
     @Observable 객체를 외부에서 받을 때 @Bindable을 사용한다.
     SwiftData의 @Model은 내부적으로 @Observable을 기반으로 하기 때문에, 똑같이 @Bindable을 쓴다. 
     */
    @Bindable var friend: Friend
    
    /**
     화면이 만들어질 때, 새로운 친구인지 여부를 받는다.
     */
    let isNew: Bool
    
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        /**
         form : iOS의 설정 앱처럼 그룹화된 리스트 스타일의 UI를 자동으로 만들어줍니다.
         */
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled() //자동 수정 기능을 비활성화
            
            Picker("Favorite Movie", selection: $friend.favoriteMovie) {
                /**
                 nil만 쓰면 타입이 애매하니까, Movie? 타입의 nil이라고 명확히 알려줘야 Picker가 favoriteMovie랑 타입을 맞출 수 있다.
                 */
                Text("None")
                    .tag(nil as Movie?)
                
                ForEach(movies) { movie in
                    Text(movie.title)
                        .tag(movie)
                }
            }
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        FriendDetail(friend: SampleData.shared.friend)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Friend") {
    NavigationStack{
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
