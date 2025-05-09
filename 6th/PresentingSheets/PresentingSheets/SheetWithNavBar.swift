//
//  SheetWithNavBar.swift
//  PresentingSheets
//
//  Created by Jiewen Wen on 2024/6/3.
//

import SwiftUI

struct SheetWithNavBar: View {
    @Environment(\.dismiss) private var dismiss
    var text: String = "Sheet with navigation bar"
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(uiColor: UIColor(white:0.9, alpha:1.0))
                    .ignoresSafeArea()
                Text(text)
            }
            .navigationTitle(Text("Sheet title"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button("Dismiss"){
                    dismiss()
                }
            }
            .toolbarBackground(.gray, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .tint(.white)
    }
}

#Preview {
    SheetWithNavBar()
}
