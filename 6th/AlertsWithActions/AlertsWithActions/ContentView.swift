//
//  ContentView.swift
//  AlertsWithActions
//
//  Created by Jiewen Wen on 2024/6/2.
//

import SwiftUI

struct ContentView: View {
    @State private var changeText = false
    @State private var displayedText = "stay foolish"
    
    var body: some View {
        Button(displayedText){
            changeText = true
        }
        .alert("Changing Text", isPresented: $changeText){
            Button("Yes",role: .destructive){
                displayedText = if(displayedText == "stay foolish"){
                    "stay hungry"
                }else{
                    "stay foolish"
                }
            }
            Button("Do nothing", role: .cancel){}
                
            //}
        }message: {
            Text("Do you want to change the text?")
        }
    }
}

#Preview {
    ContentView()
}
