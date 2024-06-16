//
//  ContentView.swift
//  ModernNavigation
//
//  Created by Jiewen Wen on 2024/6/6.
//

import SwiftUI

struct ContentView: View {
    //@StateObject private var navigation = Navigation()
    @StateObject private var storage = Storage(food: Food.samples)
    @State var selectedCategory: Category?
    @State var selectedFood: Food?
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility){
            List(selection: $selectedCategory){
                // Section("Categories"){
                ForEach(Category.allCases){category in
                    NavigationLink(category.name, value: category)
                }
                //}
            }
            .navigationTitle("Categories")
            
            } content:{
                FoodCategoryView(selectedCategory: $selectedCategory, selectedFood: $selectedFood)
                    .environmentObject(storage)
                    .onChange(of: selectedCategory, initial: false){
                        columnVisibility = .doubleColumn
                    }
            }detail:{
                FoodView(selectedCategory: $selectedCategory, selectedFood: $selectedFood)
                    .environmentObject(storage)
            }
            .navigationSplitViewStyle(.balanced)
        }
    }


#Preview {
    ContentView()
}
