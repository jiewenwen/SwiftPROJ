//
//  ContentView.swift
//  SimpleNavigation
//
//  Created by Jiewen Wen on 2024/6/5.
//

import SwiftUI

struct ChildBView: View {
    var body: some View {
        VStack{
            Image(systemName: "b.square")
                .font(.system(size: 80))
                .foregroundStyle(.brown)
            Text("This is the child b view")
                .foregroundStyle(.primary)
                .padding()
        }
        .navigationTitle("child b")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        ChildBView()
    }
}
