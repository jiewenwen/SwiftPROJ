//
//  ContentView.swift
//  AsyncAwaitSwiftUI
//
//  Created by Jiewen Wen on 2024/7/3.
//

import SwiftUI

class Service{
    func fetchResult() async -> String{
        try? await Task.sleep(for: .seconds(10))
        return "Result"
    }
}

struct ContentView: View {
    private let service = Service()
    @State private var value: String = ""
    @State private var counter = 0
    
    var body: some View {
        VStack{
            Text(value)
            Text("\(counter)")
            Button{
                counter += 1
            }label: {
                Text("increment")
            }
            .buttonStyle(.bordered)
        }
        .task {
            value = await service.fetchResult()
        }
    }
}

#Preview {
    ContentView()
}
