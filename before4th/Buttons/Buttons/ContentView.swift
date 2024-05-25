//
//  ContentView.swift
//  Buttons
//
//  Created by Jiewen Wen on 2024/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing:44){
                NavigationLink("Button"){
                    ButtonView()
                }
                NavigationLink("EditButtonView"){
                    EditButtonView()
                }
                NavigationLink("MenuButtonView"){
                    MenuButtonView()
                }
                NavigationLink("PasteButtonView"){
                    PasteButtonView()
                }
                NavigationLink("Details about text"){
                    Text("Very long text that should not be displayed in a single line because it is not good design")
                        .padding()
                        .navigationTitle(Text("Detail"))
                }
            }
            .navigationTitle(Text("Main View"))
        }
    }
}

#Preview {
    ContentView()
}
