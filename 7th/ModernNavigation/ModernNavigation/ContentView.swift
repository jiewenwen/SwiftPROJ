//
//  ContentView.swift
//  ModernNavigation
//
//  Created by Jiewen Wen on 2024/6/6.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigation = Navigation()
    @StateObject private var storage = Storage(food: Food.samples)
    
    var body: some View {
        NavigationStack(path: $navigation.path){
            List(Category.allCases){category in
                Section(category.name){
                    ForEach(storage.food(in: category)){ food in
                        NavigationLink(value:food){
                            FoodRowView(food:food)
                        }
                    }
                }
            }
            .navigationTitle("my food")
            .navigationDestination(for: Food.self){food in
                FoodView(food:food)
                    .environmentObject(navigation)
                    .environmentObject(storage)
            }        }

    }
}

#Preview {
    ContentView()
}
