//
//  SampleDate.swift
//  08. FriendsFavoriteMovies
//
//  Created by 노을 on 4/12/26.
//

import Foundation
import SwiftData
/**
 @MainActor는 "이 코드는 항상 메인 스레드에서 실행해줘" 라고 보장해주는 키워드
 */
@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    /**
     메인 스레드가 아닌 곳에서 mainContext에 접근하면 → 크래시 or 경고 발생
     */
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    var friend: Friend {
        Friend.sampleData.first!
    }
    
    var movie: Movie {
        Movie.sampleData.first!
    }
    
    /**
     init에서 샘플 데이터 넣어줌
     */
    private init() {
        let schema = Schema([
            Friend.self,
            Movie.self,
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        for movie in Movie.sampleData {
            context.insert(movie)
        }
    }
}
