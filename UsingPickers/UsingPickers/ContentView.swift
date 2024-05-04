//
//  ContentView.swift
//  UsingPickers
//
//  Created by Jiewen Wen on 2024/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var choice = 0
    @State private var showText = false
    @State private var transitModes = ["Bike", "Car", "Bus"]
    @State private var sliderVal:Float = 0
    @State private var stepVal = 0
    @State private var gameTime = Date()
    
    var body: some View {
        Form{
            Section{
                Picker("Transit Modes", selection: $choice){
                    ForEach(0 ..< transitModes.count, id: \.self){ index in
                        Text("\(transitModes[index])")
                    }
                }
                .pickerStyle(.segmented)
                Text("Current choice:\(transitModes[choice])") // choice is ++
            }
            
            Section{
                Toggle(isOn: $showText){
                    Text("Show Text")
                }
                if showText{
                    Text("The text toggle is on")
                }
            }
            
            Section{
                Slider(value: $sliderVal,in: 0...10, step: 0.001)
                Text("Slicer current value is \(sliderVal,specifier: "%.1f")")
            }
            
            Section{
                Stepper("Stepper", value:$stepVal, in: 0...15)
                Text("Stepper current value is \(stepVal)")
            }
            
            Section{
                DatePicker("Please select a date", selection: $gameTime)
            }
            
            Section{
                DatePicker("Please select a date", selection: $gameTime, in: Date()...)
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
