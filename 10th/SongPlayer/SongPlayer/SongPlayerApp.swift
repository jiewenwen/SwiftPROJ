//
//  SongPlayerApp.swift
//  SongPlayer
//
//  Created by Jiewen Wen on 2024/6/23.
//

import SwiftUI

@main
struct SongPlayerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MusicPlayer())
        }
    }
}
