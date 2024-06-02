//
//  ContentView.swift
//  PresentingAlerts
//
//  Created by Jiewen Wen on 2024/6/1.
//

import SwiftUI

struct ContentView: View {
    @State private var showSubmitAlert = false
    
    var body: some View {
        Button("Show Alert"){
            showSubmitAlert = true
        }
        .alert("confirm actions", isPresented: $showSubmitAlert){
            Button("OK"){}
        }message: {
            Text("are you sure you want to proceed?")
        }
    }
}

#Preview {
    ContentView()
}
