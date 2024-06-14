//
//  FoodRowView.swift
//  ModernNavigation
//
//  Created by Jiewen Wen on 2024/6/10.
//

import SwiftUI

struct FoodRowView: View {
    var food: Food
    var body: some View {
        LabeledContent{
            Image(food.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
        }label:{
            Text(food.name)
        }
    }
}

#Preview {
    let fruits = Array(Food.samples.prefix(6))
    return NavigationStack{
        List(fruits){fruit in
            NavigationLink(value:fruit){
                FoodRowView(food: fruit)
            }
        }
        .navigationTitle(fruits.first!.category.name)
    }
}
