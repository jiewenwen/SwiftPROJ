//
//  ContentView.swift
//  CustomRows
//
//  Created by Jiewen Wen on 2024/4/28.
//

import SwiftUI

struct ContentView: View {
    
    var weatherData: [WeatherInfo]
    
    var body: some View {
        List{
            ForEach(weatherData){ weather in
                WeatherRow(weather: weather)
            }
        }
    }
}

#Preview {
    ContentView(weatherData: WeatherInfo.weatherData)
}
