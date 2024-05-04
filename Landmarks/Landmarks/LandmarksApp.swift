//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Jiewen Wen on 2024/1/8.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
