//
//  ContentView.swift
//  ListWithSections
//
//  Created by Jiewen Wen on 2024/4/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("North America")){
                    Text("USA")
                    Text("Canada")
                    Text("Mexico")
                    Text("Panama")
                    Text("Anguilla")
                }
                
                Section(header: Text("Africa")){
                    Text("Nigeria")
                    Text("Ghana")
                    Text("Kenya")
                    Text("Senegal")
                }
                
                Section(header: Text("Europe")){
                    Text("Spain")
                    Text("France")
                    Text("Sweden")
                    Text("Finland")
                    Text("UK")
                    }
            }
            .listStyle(.grouped)
            .navigationTitle("Continents and Countries")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
