//
//  ContentView.swift
//  LazyGrids
//
//  Created by Jiewen Wen on 2024/5/5.
//

import SwiftUI

struct ContentView: View {
    
    let columnSpec = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    let rowSpec = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let colors: [Color] = [.green, .red, .yellow, .blue]
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: columnSpec, spacing: 20){
                    ForEach(1...999, id:\.self){ index in
                        Text("Item \(index)")
                            .padding(EdgeInsets(top:30, leading:15, bottom:30, trailing:15))
                            .background(colors[index % colors.count])
                            .clipShape(Capsule())
                    }
                }
            }
            
            ScrollView(.horizontal){
                LazyHGrid(rows: rowSpec, spacing: 20){
                    ForEach(1...999, id:\.self){ index in
                        Text("Item \(index)")
                            .foregroundStyle(.white)
                            .padding(EdgeInsets(top:30, leading:15, bottom:30, trailing:15))
                            .background(colors[index % colors.count])
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
