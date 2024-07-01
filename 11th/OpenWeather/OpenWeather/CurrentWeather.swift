//
//  CurrentWeather.swift
//  OpenWeather
//
//  Created by Jiewen Wen on 2024/7/1.
//

import SwiftUI

struct CurrentWeather: View {
    // @StateObject var weatherService = WeatherService()
    let current: Weather
    
    var body: some View {
        VStack(spacing: 28){
            Text(current.time
                .formatted(date: .long, time: .standard)
            )
            HStack{
                Image(systemName: current.icon.weatherIcon)
                    .font(.system(size: 98))
                Text("\(current.temperature.formatted)")
                    .font(.system(size: 46))
            }
            Text("\(current.summary)")
        }
    }
}

//#Preview {
//    CurrentWeather()
//}


