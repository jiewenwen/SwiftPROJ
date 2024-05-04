//
//  ContentView.swift
//  UsingViewBuild
//
//  Created by Jiewen Wen on 2024/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            BlueCircle{
                Text("some text here")
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 40, height: 40)
            }
            BlueCircle{
                Text("Another example")
            }
        }
    }
}

#Preview {
    ContentView()
}
