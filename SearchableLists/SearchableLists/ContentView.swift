//
//  ContentView.swift
//  SearchableLists
//
//  Created by Jiewen Wen on 2024/5/4.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    let food: [Food] = Food.sampleFood
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(searchResults, id:\.self){ food in
                    LabeledContent(food.name){ Text("\(food.category.rawValue)")
                    }
                }
                .searchable(text: $searchText, prompt: "search for a food")
                .navigationTitle("Foods")
            }
        }
    }
    
    var searchResults: [Food] {
        if searchText.isEmpty{
            return food
        }else{
            return food.filter{ 
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

#Preview {
    ContentView()
}
