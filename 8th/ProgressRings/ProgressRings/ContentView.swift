//
//  ContentView.swift
//  ProgressRings
//
//  Created by Jiewen Wen on 2024/6/18.
//

import SwiftUI


struct ContentView: View {
    @State private var progressExternal = 0.3
    @State private var progressCentral = 0.7
    @State private var progressInternal = 0.5
    
    var body: some View {
        ZStack{
            ProgressRingsView(progressExternal: progressExternal, progressCentral: progressCentral, progressInternal: progressInternal)
                .aspectRatio(contentMode: .fit)
            
            VStack(spacing: 10){
                Spacer()
                Slider(value: $progressInternal, in: 0...1, step: 0.01)
                Slider(value: $progressCentral, in: 0...1, step: 0.01)
                Slider(value: $progressExternal, in: 0...1, step: 0.01)
            }
            .padding(20)
        }
    }
}

#Preview {
    ContentView()
}
