//
//  FeatureCard.swift
//  OnboardingFlow
//
//  Created by 노을 on 3/27/26.
//

import SwiftUI

struct FeatureCard: View {
    
    let iconName: String
    let description: String
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 60)
                .padding(.trailing, 10)
            
            Text(description)
            Spacer()
             //스페이서는 포함하는 스택 방향의 빈 공간을 채우기 위해 최대한 팽창합니다.
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.tint)
                .opacity(0.3)
                .brightness(-0.4)
        }
        .padding(.horizontal)
        .foregroundStyle(.white)
        
    }
}

#Preview {
    FeatureCard(iconName: "person.2.crop.square.stack.fill", description: "A multiline description about a feature paired with the image on the left.")
}
