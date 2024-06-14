//
//  FoodCategoryView.swift
//  ModernNavigation
//
//  Created by Jiewen Wen on 2024/6/12.
//

import SwiftUI

struct FoodCategoryView: View {
    @EnvironmentObject private var storage: Storage
    var category: Category
    
    var body: some View {
        List(storage.food(in: category)){ food in
            NavigationLink(value: food){
                FoodRowView(food: food)
            }
        }
        .navigationTitle(category.name)
    }
}

#Preview {
    NavigationStack{
        FoodCategoryView(category: .fruit)
            .environmentObject(Storage(food: Food.samples))
    }
}
