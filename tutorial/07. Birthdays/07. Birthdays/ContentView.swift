//
//  ContentView.swift
//  07. Birthdays
//
//  Created by 노을 on 4/11/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    @Environment(\.modelContext) private var context // 새로운 데이터 저장을 위해 환경변수가 필요
    
    @State private var newName : String = ""
    @State private var newBirthday : Date = .now
    
    var body: some View {
        NavigationStack {
            
            //SwiftDate가 자동으로 인스턴스를 식별
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
        }
        .navigationTitle("Birthdays")
        .safeAreaInset(edge: .bottom) {
            VStack(alignment: .center, spacing: 20) {
                Text("New Birthday")
                    .font(.headline)
                
                //미래 날짜를 설정할 수 없도록
                DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                    TextField("Name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                }
                Button("Save") {
                    let newFriend = Friend(name: newName, birthday: newBirthday)
                    context.insert(newFriend)
                    
                    newName = ""
                    newBirthday = .now
                }
                .bold()
            }
            .padding()
            .background(.bar)
        }
        // 뷰가 나타나기 전에 실행됨.
        .task {
            context.insert(Friend(name: "Elton Lin", birthday: .now))
            context.insert(Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0)))
        }
        
    }
}

#Preview {
    ContentView()
}
