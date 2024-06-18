//
//  ContentView.swift
//  BuiltInShapes
//
//  Created by Jiewen Wen on 2024/6/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing:10){
            Rectangle()
                .stroke(.orange,lineWidth: 15)
            RoundedRectangle(cornerRadius: 20)
                .fill(.red)
            UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 20,bottomLeading: 35,bottomTrailing: 20,topTrailing: 0),style: .circular)
                .fill(.teal)
            Capsule(style: .continuous)
                .fill(.green)
                .frame(height: 100)
            Capsule(style: .circular)
                .fill(.yellow)
                .frame(height: 100)
            
            Circle()
                .strokeBorder(.blue,lineWidth: 15)
            Ellipse()
                .fill(.purple)
        }
        .padding(.horizontal,20)
    }
}

#Preview {
    ContentView()
}
