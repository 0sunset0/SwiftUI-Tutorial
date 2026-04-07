//
//  DayForecast.swift
//  WeatherForecast
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct DayForecast: View {
    /**
     저장 프로퍼티 Stored property
     */
    let dayWeather: DayWeather
    
    /**
     연산 프로퍼티(Computed property)
     */
    var iconName: String {
        if dayWeather.isRainy{
            return "cloud.rain.fill"
        }else{
            return "sun.max.fill"
        }
        
    }
    
    var iconColor: Color {
        if dayWeather.isRainy{
            return Color.blue
        }else{
            return Color.yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(dayWeather.day)
                .font(Font.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
                .padding()
            Text("High: \(dayWeather.high)")
                .fontWeight(Font.Weight.semibold)
            Text("Low: \(dayWeather.low)")
                .fontWeight(Font.Weight.semibold)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}


#Preview {
    DayForecast(dayWeather: sampleWeather[0])
}
