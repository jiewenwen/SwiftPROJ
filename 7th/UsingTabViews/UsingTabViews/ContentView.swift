//
//  ContentView.swift
//  UsingTabViews
//
//  Created by Jiewen Wen on 2024/6/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("home",systemImage: "hourse.fill")
                }
            
            CurrenciesView()
                .tabItem {
                    Label("Currencies",systemImage: "coloncurrencysign.circle.fill")
                }
            
//            Text("Text")
//                .tabItem { Label("text",systemImage: "hourse.fill") }
        }
    }
}

#Preview {
    ContentView()
}
