//
//  ContentView.swift
//  DisplayingPopovers
//
//  Created by Jiewen Wen on 2024/6/3.
//

import SwiftUI

struct ContentView: View {
    @State private var showPopover = false
    
    var body: some View {
        Button("show popover"){
            showPopover = true
        }
        .font(.system(size: 40))
        .popover(isPresented: $showPopover){
            Text("popover content displayed here")
                .font(.system(size: 20))
                .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
