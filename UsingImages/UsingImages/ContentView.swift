//
//  ContentView.swift
//  UsingImages
//
//  Created by Jiewen Wen on 2024/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.dogs1)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image(.dogAndNature)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300,height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(.blue,lineWidth: 6))
                .shadow(radius: 10)
            Image(.dog2)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:200,height:200)

        }
        //.padding()
    }
}

#Preview {
    ContentView()
}
