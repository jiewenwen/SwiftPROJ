//
//  SwiftUICoreLocationApp.swift
//  SwiftUICoreLocation
//
//  Created by Jiewen Wen on 2024/6/22.
//

import SwiftUI

@main
struct SwiftUICoreLocationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(locationManager: LocationManager())
        }
    }
}
