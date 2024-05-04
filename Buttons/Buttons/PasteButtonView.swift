//
//  PasteButtonView.swift
//  Buttons
//
//  Created by Jiewen Wen on 2024/4/23.
//

import SwiftUI

struct PasteButtonView: View {
    @State var text = String()
    var body: some View {
        VStack{
            Text("PasteButton controls how you paste in macOS but it is not available in ios, for more information, check the \" See also \" section of this recipe")
                .padding()
        }
        .navigationTitle("PasteButton")
    }
}

#Preview {
    NavigationStack{
        PasteButtonView()
    }
}
