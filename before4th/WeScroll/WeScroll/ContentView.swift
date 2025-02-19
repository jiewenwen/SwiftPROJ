//
//  ContentView.swift
//  WeScroll
//
//  Created by Jiewen Wen on 2024/4/27.
//

import SwiftUI

struct ContentView: View {
    
    let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p"]
    @State private var flashIndicators = false
    
    var body: some View {
        VStack{
            ScrollView{
                ForEach(letters, id:\.self){ letter in
                    Image(systemName: letter)
                        .font(.largeTitle)
                        .foregroundStyle(.yellow)
                        .frame(width: 50, height: 50)
                        .background(.blue)
                        .symbolVariant(.circle.fill)
                }
            }
            .frame(width: 50, height: 240)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(letters, id:\.self){ letter in
                        Image(systemName: letter)
                            .font(.largeTitle)
                            .foregroundStyle(.yellow)
                            .frame(width: 50, height: 50)
                            .background(.blue)
                            .symbolVariant(.circle.fill)
                    }
                }
            }
            .scrollIndicatorsFlash(trigger:flashIndicators)
            .padding(.bottom)
            Button("Flash "){
                flashIndicators.toggle()
            }
        }
        .scrollIndicators(.visible,axes: .vertical)
    }
}

#Preview {
    ContentView()
}
