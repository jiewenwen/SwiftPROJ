//
//  ContentView.swift
//  MoreViewsAndControls
//
//  Created by Jiewen Wen on 2024/4/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress = 0.5
    @State private var color = Color.red
    @State private var secondColor = Color.yellow
    @State private var someText = "Initial value"
    
    var body: some View {
        List{
            Section(header: Text("ProgressViews")){
                ProgressView("Indeterminate progress view")
                ProgressView("Downloading", value:progress, total: 2)
                Button("More"){
                    if(progress < 2){
                        progress += 0.5
                    }
                }
            }
            
            Section(header: Text("Labels")){
                Label("Slow ", systemImage: "tortoise.fill")
                Label{
                    Text("Fast").font(.title)
                } icon:{
                    Circle()
                        .fill(Color.orange)
                        .frame(width:40, height: 20,alignment: .center )
                        .overlay(Text("F"))
                }
            }
            
            Section(header: Text("ColorPicker")){
                ColorPicker(selection: $color){
                    Text("Pick my background")
                        .background(color)
                        .padding()
                }
                ColorPicker("Picker", selection: $secondColor)
            }
            
            Section(header: Text("Link")){
                Link("Packet Publishing", destination:  URL(string: "https://www.packtpub.com/")!)
            }
            
            Section(header: Text("TextEditer")){
                Text("current editer text: \n\(someText)")
            }
            
            Section(header: Text("Menu")){
                Menu("Actions"){
                    Button("Set TextEditer text to 'magic'"){
                        someText = "magic"
                    }
                    Button("Turn first picker green"){
                        color = Color.green
                    }
                    Menu("Action"){
                        Button("Set TextEditer text to 'mreal agic'"){
                            someText = "real magic"
                        }
                        Button("Turn first picker gray"){
                            color = Color.gray
                        }
                    }
                }
            }
        }
        .listStyle(.grouped)
    }
}

#Preview {
    ContentView()
}
