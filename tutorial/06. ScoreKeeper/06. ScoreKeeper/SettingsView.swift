//
//  SettingsView.swift
//  06. ScoreKeeper
//
//  Created by 노을 on 4/11/26.
//

import SwiftUI

struct SettingsView: View {
    @Binding var doesHighestScoreWin: Bool
    @Binding var startingPoints : Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Ruls")
                .font(.headline)
            Divider()
            
            Picker("Win condition", selection: $doesHighestScoreWin) {
                Text("Highest Score Wins")
                    .tag(true)
                Text("Lowest Score Wins")
                    .tag(false)
            }
            
            /**
             사용자가 태그를 선택하면 피커의 바인딩이 해당 태그 값으로 업데이트됩니다.
             */
            Picker("Starting points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
            
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: (10.0)))
        
    }
}

#Preview {
    /**
     @Previewable매크로는 미리보기에서 동적 속성을 인라인으로 사용할 수 있게 해줍니다.
     */
    @Previewable @State var doesHighestScoreWin = true
    @Previewable @State var startingPoints: Int = 10
    SettingsView(doesHighestScoreWin: $doesHighestScoreWin, startingPoints: $startingPoints)
}
