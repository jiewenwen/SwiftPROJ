//
//  ContentView.swift
//  PresentingSheets
//
//  Created by Jiewen Wen on 2024/6/2.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSheetPresented = false
    @State private var isSheetWithNavPresented = false
    @State private var isFullScreenCoverPresented = false
    
    var body: some View {
        VStack(spacing: 20){
            Button("try me"){
                print("try me")
            }
            .padding(.bottom,200)
            
            Button("Show sheet with drag"){
                isSheetPresented = true
            }
            .sheet(isPresented: $isSheetPresented){
                SheetView()
                    .presentationDragIndicator(.visible)
            }
            
            Button("show alert with navition bar"){
                isSheetWithNavPresented = true
            }
            .sheet(isPresented: $isSheetWithNavPresented){
                print("sheet dismissed")
            }content:{
                SheetWithNavBar(text: "sheet with navigation bar and presentation detents")
                    
            }
            .presentationDetents([.medium, .large])
            .presentationBackgroundInteraction(.enabled)
            
            Button("show full screen cover"){
                isFullScreenCoverPresented = true
            }
            .fullScreenCover(isPresented: $isFullScreenCoverPresented){
                SheetWithNavBar(text: "full screen cover with navigation bar")
            }
        }
    }
}

#Preview {
    ContentView()
}
