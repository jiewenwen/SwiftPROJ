//
//  MenuButtonView.swift
//  Buttons
//
//  Created by Jiewen Wen on 2024/4/23.
//

import SwiftUI

struct MenuButtonView: View {
    var body: some View {
        Menu("Choose a country"){
            Button("Canada"){print("Selected Canada")}
            Button("Mexico"){print("Selected Mexico")}
            Button("USA"){print("Selected USA")}
        }
        .navigationTitle("MenuButtons")
    }
}

#Preview {
    NavigationStack{
        MenuButtonView()
    }
}
