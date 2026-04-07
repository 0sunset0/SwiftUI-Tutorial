//
//  DayWeather.swift
//  WeatherForecast
//
//  Created by 노을 on 3/28/26.
//

import Foundation

let sampleWeather: [DayWeather] = [
    DayWeather(id: 1, day: "Sun", isRainy: false, high: 78, low: 65),
    DayWeather(id: 2, day: "Mon", isRainy: true, high: 72, low: 60),
    DayWeather(id: 3, day: "Wed", isRainy: false, high: 75, low: 68)
]

//날씨 데이터는 바뀔 일이 없으니 let으로
struct DayWeather: Identifiable {
    let id: Int
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
}
