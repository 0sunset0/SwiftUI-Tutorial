//
//  DiceView.swift
//  DiceRoller
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct DiceView: View {
    
    /**
    주사위를 굴려서 값이 바뀌어야 한다면 @​State가 필요하고, 부모 뷰에서 "3번 주사위를 보여줘"라고 넘겨주는 거라면 일반 var로 충분합니다.
    */

    /**
    @State O
    뷰 자체가 소유하고 관리하는 상태
    값이 바뀌면 SwiftUI가 자동으로 화면을 다시 그림
    private을 붙이는 게 관례 -> 이 상태는 뷰 안에서만 관리한다는 의미
    */

    /**
    @State X
    외부에서 값을 전달받는 일반 프로퍼티
    뷰 내부에서 값을 변경할 수 없음
    부모뷰가 값을 결정함.
    */
    
    @State private var numberOfPips: Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)
            
            Button("Roll") {
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DiceView()
}
