//
//  CustomRowsApp.swift
//  CustomRows
//
//  Created by Jiewen Wen on 2024/4/28.
//

import SwiftUI

@main
struct CustomRowsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(weatherData: WeatherInfo.weatherData)
        }
    }
}
