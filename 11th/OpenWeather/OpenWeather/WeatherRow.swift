//
//  WeatherRow.swift
//  OpenWeather
//
//  Created by Jiewen Wen on 2024/7/1.
//

import SwiftUI

struct WeatherRow: View {
    let weather: Weather
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        HStack(){
            Image(systemName: weather.icon.weatherIcon)
                .frame(width: 40)
                .font(.system(size: 28))
            VStack(alignment: .leading){
                Text(weather.summary)
                Text(weather.time.formatted(date:.long,time:.standard))
                    .font(.system(.footnote))
            }
            Spacer()
            Text("\(weather.temperature.formatted) ")
                .frame(width: 40)
        }
        .padding(.horizontal,16)
    }
}

//#Preview {
//    WeatherRow()
//}
