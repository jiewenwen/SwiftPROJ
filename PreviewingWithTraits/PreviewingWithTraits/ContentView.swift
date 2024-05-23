//
//  ContentView.swift
//  PreviewingWithTraits
//
//  Created by Jiewen Wen on 2024/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.teal
                .frame(width: 200,height: 150)
            VStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                Text("Hello world")
                    .font(.title2)
            }
            .foregroundStyle(.primary)
            .padding(.all, 20)
            .background()
            .border(.tertiary, width: 10)
        }
    }
}

#Preview ("Portrait"){
    ContentView()
}

#Preview ("Landscape", traits: .landscapeLeft){
    ContentView()
}

#Preview ("upside down", traits: .portraitUpsideDown){
    ContentView()
}

#Preview ("size that fits", traits: .sizeThatFitsLayout){
    ContentView()
}

#Preview ("fixed size", traits: .fixedLayout(width: 500, height: 500)){
    ContentView()
}
