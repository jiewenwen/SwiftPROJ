//
//  ContentView.swift
//  SimpleNavigation
//
//  Created by Jiewen Wen on 2024/6/5.
//

import SwiftUI

struct ChildAView: View {
    @State private var title = "child A"
    
    var body: some View {
        VStack{
            Image(systemName: "a.square")
                .font(.system(size: 80))
                .foregroundStyle(.yellow)
            Text("This is the child a view")
                .foregroundStyle(.primary)
                .padding()
        }
        .navigationTitle($title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        ChildAView()
    }
}
