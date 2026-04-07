//
//  WelcomePage.swift
//  OnboardingFlow
//
//  Created by 노을 on 3/27/26.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint) //앱의 강조 색상 (기본값이 blue)
                
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.system(size: 70)) //시스템 글꼴을 사용하여 크기 설정
                    .foregroundStyle(.white)
            }
            
            
            Text("Welcme to My App")
                .font(.title) //타입 추론
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("Description")
                .font(.title2)
                .multilineTextAlignment(.center)
        }
        .padding()

    }
}

#Preview {
    WelcomePage()
}
