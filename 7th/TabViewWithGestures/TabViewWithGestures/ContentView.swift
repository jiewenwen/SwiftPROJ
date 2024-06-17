//
//  ContentView.swift
//  TabViewWithGestures
//
//  Created by Jiewen Wen on 2024/6/17.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            Text("left tab. Tap to swich to right")
                .onTapGesture {
                    selectedTab = 1
                }
                .tabItem {
                    Label("Left",systemImage: "l.circle.fill")
                }
                .tag(0)
            
            Text("right tab. tap to switch to left")
                .onTapGesture {
                    selectedTab = 0
                }
                .tabItem {
                    Label("right", systemImage: "r.circle.fill")
                }
                .tag(1)
        }
    }
}

#Preview {
    ContentView()
}
