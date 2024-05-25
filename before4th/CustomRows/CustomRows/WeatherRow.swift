//
//  WeatherRow.swift
//  CustomRows
//
//  Created by Jiewen Wen on 2024/4/28.
//

import SwiftUI

struct WeatherRow: View {
    
    var weather: WeatherInfo
    
    var body: some View {
        HStack{
            Image(systemName: weather.image)
                .frame(width: 50,alignment: .leading)
            Text("\(weather.image)F")
                .frame(width: 80,alignment: .leading)
            Text(weather.city)
        }
        .font(.system(size: 20))
        .padding()
    }
}

#Preview {
    WeatherRow(weather: WeatherInfo(image: "snow", temp: 5, city: "New York"))
}
