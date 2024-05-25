//
//  ContentView.swift
//  LazyStacks
//
//  Created by Jiewen Wen on 2024/5/4.
//

import SwiftUI

struct ListRow: View{
    let id: Int
    let type: String
    
    init(id: Int, type: String){
        print("Loading \(type) item \(id)")
        self.id = id
        self.type = type
    }
    
    var body: some View{
        Text("\(type) \(id)").padding()
    }
}

struct ContentView: View {
    var body: some View {
        VStack{
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(1...10000, id:\.self){ item in
                        ListRow(id: item, type: "Horizontal")
                    }
                }
            }
            .frame(height: 100, alignment: .center)
            
            ScrollView{
                LazyVStack{
                    ForEach(1...10000, id:\.self){ item in
                        ListRow(id: item, type: "Vertical")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
