//
//  ContentView.swift
//  Test01
//
//  Created by Jiewen Wen on 2024/4/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("VStack Item 1")
            Text("VStack Item 2")
            //Spacer()
            Divider()
                .background(.black)
            Text("VStack Item 3")
        }
        .background(.blue)
        HStack{
            Text("HStack Item 1")
            Divider()
                .background(.black)
            Text("HStext Item 2")
            Divider()
                .background(.black)
            Spacer()
            Text("HStack Item 3")
            
        }
        .background(Color.red)
        
        ZStack{
            Text("ZStack Item 1")
                .padding()
                .background(.green)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            Text("ZStack Item 2")
                .padding()
                .background(.green)
                .offset(x:80,y:-400)
        }

    }
}

#Preview {
    ContentView()
}



