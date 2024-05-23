//
//  ContentView.swift
//  PreviewingInNavigationStack
//
//  Created by Jiewen Wen on 2024/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationLink(destination: SecondView(someText: "Text passed from ContentView")){
                Text("Go to second view")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(25)
            }
            .navigationTitle("Previews")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview("ContentView") {
        ContentView()
}
