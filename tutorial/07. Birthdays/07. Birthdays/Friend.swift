//
//  Friend.swift
//  07. Birthdays
//
//  Created by 노을 on 4/11/26.
//

import Foundation
import SwiftData

/**
 클래스 인스턴스는 구조체 인스턴스에는 없는 고유한 식별자를 가지고 있습니다.
 SwiftData는 이 식별자를 사용하여 앱 전체에서 필요한 모든 뷰와 모델 데이터를 공유합니다.
 */
@Model
class Friend {
    var name: String
    var birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
}
