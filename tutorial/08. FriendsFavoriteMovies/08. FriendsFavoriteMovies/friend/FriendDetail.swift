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
    let isNew: Bool
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled() //자동 수정 기능을 비활성화
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
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
}
