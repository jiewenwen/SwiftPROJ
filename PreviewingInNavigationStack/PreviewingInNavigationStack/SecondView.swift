//
//  SecondView.swift
//  PreviewingInNavigationStack
//
//  Created by Jiewen Wen on 2024/5/23.
//

import SwiftUI

struct SecondView: View {
    var someText: String
    var body: some View{
        Text(someText)
            .navigationTitle("second View")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("SecondView") {
    NavigationStack{
        SecondView(someText: "This is the second view")
    }
}
