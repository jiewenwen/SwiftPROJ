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
        NavigationStack(path:$navigation.path){
            List{
                Section("Categories"){
                    ForEach(Category.allCases){category in
                        NavigationLink(category.name, value: category)
                    }
                }
                
                Section("Favorites"){
                    if storage.favorites.isEmpty{
                        Text("no favorites added")
                    }else{
                        ForEach(storage.favorites){ food in
                            NavigationLink(value: food){
                                FoodRowView(food: food)
                            }
                        }
                    }
                }
            }
            .navigationTitle("My food")
            .navigationDestination(for: Category.self){category in
            FoodCategoryView(category: category)
                    .environmentObject(storage)
            }
            .navigationDestination(for: Food.self){ food in
                FoodView(food:food)
                    .environmentObject(navigation)
                    .environmentObject(storage)
            }
            
            
        }

    }
}

#Preview {
    ContentView()
}
