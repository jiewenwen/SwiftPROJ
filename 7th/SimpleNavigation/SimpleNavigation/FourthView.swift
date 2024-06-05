//
//  FourthView.swift
//  SimpleNavigation
//
//  Created by Jiewen Wen on 2024/6/5.
//

import SwiftUI

struct FourthView: View {
    @State private var isSheetPresented = false
    var body: some View {
        ScrollView{
            Image(systemName: "capsule")
                .font(.system(size: 80))
                .foregroundStyle(.red)
                .padding(.vertical,50)
            Text("this is the fourth view")
                .foregroundStyle(.primary)
                .padding()
            Button("show sheet"){
                isSheetPresented = true
            }
            .sheet(isPresented: $isSheetPresented){
                SheetView()
                    .presentationDetents([.fraction(0.75)])
                    .presentationDragIndicator(.visible)
            }
        }
        .navigationTitle("fourth")
        .toolbarBackground(.quaternary, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    NavigationStack{
        FourthView()
    }
}
