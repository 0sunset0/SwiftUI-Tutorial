//
//  _7__BirthdaysApp.swift
//  07. Birthdays
//
//  Created by 노을 on 4/11/26.
//

import SwiftUI
import SwiftData

@main
struct _7__BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
