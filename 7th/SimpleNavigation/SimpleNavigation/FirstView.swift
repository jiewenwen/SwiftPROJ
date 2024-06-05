//
//  FirstView.swift
//  SimpleNavigation
//
//  Created by Jiewen Wen on 2024/6/5.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        VStack{
            Image(systemName: "circle")
                .font(.system(size: 80))
                .foregroundStyle(.cyan)
            Text("this is the first view")
                .foregroundStyle(.primary)
                .padding()
            VStack(spacing:20){
                NavigationLink("show child a"){
                    ChildAView()
                }
                NavigationLink("show child b"){
                    ChildBView()
                }
            }
        }
        .padding()
        .navigationTitle("First")
    }
}

#Preview {
    NavigationStack{
        FirstView()
    }
}
