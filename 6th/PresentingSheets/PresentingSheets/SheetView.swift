//
//  SheetView.swift
//  PresentingSheets
//
//  Created by Jiewen Wen on 2024/6/2.
//

import SwiftUI

struct SheetView: View {
    var body: some View {
        ZStack{
            Color.cyan
                .ignoresSafeArea()
            Text("this is the sheet we want to display")
        }
    }
}

#Preview {
    SheetView()
}
