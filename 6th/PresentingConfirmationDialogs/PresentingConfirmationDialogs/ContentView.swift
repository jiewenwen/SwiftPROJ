//
//  ContentView.swift
//  PresentingConfirmationDialogs
//
//  Created by Jiewen Wen on 2024/6/2.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDialog = false
    private var title = "Confirmation Dialog"
    
    var body: some View {
        Button("Present Confirmation Dialog"){
            showDialog = true
        }
        .confirmationDialog(title, isPresented: $showDialog){
            Button("Save"){
                print("Save action")
            }
            Button("Print"){
                print("Print action")
            }
            Button("update",role: .destructive){
                print("Update action")
            }
        }message: {
            Text("Use Confirmation Dialog to present serveral actions")
        }
    }
}

#Preview {
    ContentView()
}
