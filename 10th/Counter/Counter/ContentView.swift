//
//  ContentView.swift
//  Counter
//
//  Created by Jiewen Wen on 2024/6/23.
//

import SwiftUI

struct ContentView: View {
    @State var refreshedAt: Date = Date()
    
    var body: some View {
        VStack(spacing:12){
            Text("Refresh at ") + Text(refreshedAt.formatted(date:.omitted, time: .standard))
            CounterView()
            
            Button{
                refreshedAt = Date()
            }label: {
                Text("Refresh")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.blue)
            }
        }
    }
}

#Preview {
    ContentView()
}
