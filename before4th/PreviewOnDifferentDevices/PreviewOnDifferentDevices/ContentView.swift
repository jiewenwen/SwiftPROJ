//
//  ContentView.swift
//  PreviewOnDifferentDevices
//
//  Created by Jiewen Wen on 2024/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image(.friendship)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Importance of friendship")
                .font(.title)
            Text("friend helps is feal with stress and make better life chioces")
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview ("friendship"){
    ContentView()
}
