//
//  ContentView.swift
//  WeatherForecast
//
//  Created by 노을 on 3/27/26.
//

import SwiftUI


struct ContentView: View {
    let forecasts: [DayWeather] = sampleWeather
    
    var body: some View {
        HStack {
            ForEach(forecasts) { forecast in
                DayForecast(dayWeather: forecast)
            }
        }
    }
}


#Preview {
    ContentView()
}
