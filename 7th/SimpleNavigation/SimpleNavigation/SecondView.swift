//
//  SecondView.swift
//  SimpleNavigation
//
//  Created by Jiewen Wen on 2024/6/5.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack{
            Image(systemName: "square")
                .font(.system(size: 80))
                .foregroundStyle(.blue)
            Text("this is the second view")
                .foregroundStyle(.primary)
                .padding()
            List{
                NavigationLink("show child a"){
                    ChildAView()
                }
                NavigationLink("show child b"){
                    ChildBView()
                }
            }
            .listStyle(.inset)
            .frame(height: 160)
        }
        .padding()
        .navigationTitle("second")
    }
}

#Preview {
    NavigationStack{
        SecondView()
    }
}
