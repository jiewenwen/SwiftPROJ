//
//  ContentView.swift
//  OpenWeather
//
//  Created by Jiewen Wen on 2024/7/1.
//

import SwiftUI

extension Double {
    var formatted: String{
        String(format: "%.0f", self)
    }
}

extension String {
    var weatherIcon: String {
        switch self {
        case "01d":
            return "sun.max"
        case "02d":
            return "cloud.sun"
        case "03d":
            return "cloud"
        case "04d":
            return "cloud.fill"
        case "09d":
            return "cloud.rain"
        case "10d":
            return "cloud.sun.rain"
        case "11d":
            return "cloud.bolt"
        case "13d":
            return "cloud.snow"
        case "50d":
            return "cloud.fog"
        case "01n":
            return "moon"
        case "02n":
            return "cloud.moon"
        case "03n":
            return "cloud"
        case "04n":
            return "cloud.fill"
        case "09n":
            return "cloud.rain"
        case "10n":
            return "cloud.moon.rain"
        case "11n":
            return "cloud.bolt"
        case "13n":
            return "cloud.snow"
        case "50n":
            return "cloud.fog"
        default:
            return "icloud.slash"
        }
    }
}

struct ContentView: View {
    @StateObject var weatherService = WeatherService()
    
    var body: some View {
        VStack(spacing: 28){
            Text(weatherService.errorMessage)
                .font(.largeTitle)
            
            if let currentWeather = weatherService.current{
                VStack{
                    CurrentWeather(current: currentWeather)
                    List(weatherService.forecast){
                        WeatherRow(weather: $0)
                    }
                    .listStyle(.plain)
                }
            }
        }
        .task {
            weatherService.load(latitude: 23.10039, longitude: 113.29410)
        }
    }
}

#Preview {
    ContentView()
}
