//
//  ContentView.swift
//  SimpleNavigation
//
//  Created by Jiewen Wen on 2024/6/5.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink("show first view"){
                    FirstView()
                }
                NavigationLink("show second view"){
                    SecondView()
                }
                NavigationLink("show third view"){
                    ThirdView()
                }
                NavigationLink("show fourth view"){
                    FourthView()
                }
            }
            .navigationTitle("top level")
        }
        .tint(.teal)

    }
}

#Preview {
    NavigationStack{
        ContentView()
    }
}
