//
//  ContentView.swift
//  DiceRoller
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numberOfDice: Int = 3
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.white)
            
            HStack {
                /**
                 변수 범위는 id 지정 필요함.
                 \.self : 값을 그래도 id로
                 \.description : 값을 스트링으로 변환시켜서 id로 사용
                 */
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()
                }
            }
            /**
             HStack는 화면 범위를 벗어나야 하는 경우에도 항상 하위 뷰에 요청된 크기를 제공한다.
             */
            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill"){
                    withAnimation{
                        numberOfDice -= 1
                    }
                }
                .disabled(numberOfDice == 1)
                
                Button("Add Dice", systemImage: "plus.circle.fill"){
                    withAnimation{
                        numberOfDice += 1
                    }
                }
                .disabled(numberOfDice == 5)
                
                /**
                 기존의 Remove Dice 버튼의 코드를 아래와 같이 바꿔보세요. 어떻게 작동하나요? 만약 같다면, 어떤 문법적인 규칙이 있을까요?
                 */
                Button("Remove Dice", systemImage: "minus.circle.fill", action: {
                    withAnimation {
                        numberOfDice -= 1
                    }
                })
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .labelStyle(.iconOnly)
        .font(.title)
        .background(Color.appBackground)
        .tint(.white)
        
    }
}

#Preview {
    ContentView()
}
