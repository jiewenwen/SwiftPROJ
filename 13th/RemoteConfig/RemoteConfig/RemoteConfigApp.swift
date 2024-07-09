//
//  RemoteConfigApp.swift
//  RemoteConfig
//
//  Created by Jiewen Wen on 2024/7/9.
//

import SwiftUI
import Firebase

@main
struct RemoteConfigApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
