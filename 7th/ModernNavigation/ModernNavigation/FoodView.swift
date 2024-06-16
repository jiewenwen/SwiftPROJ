//
//  FoodView.swift
//  ModernNavigation
//
//  Created by Jiewen Wen on 2024/6/10.
//

import SwiftUI

struct FoodView: View {
    
    @EnvironmentObject private var storage: Storage
    // @EnvironmentObject private var navigation: Navigation
    @Binding var selectedCategory:Category?
    @Binding var selectedFood: Food?

    var body: some View {
        if let food = selectedFood{
            VStack(alignment: .leading){
                CategoryView(category: food.category)
                    .padding()
                Image(food.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity,maxHeight: 300)
                
                if storage.recents.isEmpty{
                    Spacer()
                }else{
                    List{
                        Section("Recents"){
                            ForEach(storage.recents){ recent in
                                //NavigationLink(value: recent){
                                FoodRowView(food: recent)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        if recent != food {
                                            selectedFood = recent
                                            selectedCategory = recent.category
                                        }
                                    }
                                //}
                                //.disabled(recent == food)
                            }
                        }
                    }
                    .listStyle(.grouped)
                }
                
            }
            .navigationTitle(food.name)
            //        .toolbar{
            //            Button{
            //                storage.toggleFavorite(food)
            //            }label:{
            //                if storage.isFavorites(food){
            //                    Image(systemName: "minus.square")
            //                }else{
            //                    Image(systemName: "plus.square")
            //                }
            //            }
            //
            //            Button{
            //                navigation.popToRoot()
            //            }label: {
            //                Image(systemName: "list.bullet")
            //            }
            //        }
            .onChange(of: food) { oldValue, newValue in
                storage.addRecents(oldValue)
                
            }
            .onDisappear{ [selectedFood] in
                storage.addRecents(selectedFood!)
            }
        }else{
            Text("choose a type of food")
        }
    }
}

#Preview {
    let fruits = Array(Food.samples.prefix(4))
    return NavigationStack{
        FoodView(selectedCategory: .constant(.fruit), selectedFood: .constant(fruits.first!))
            //.environmentObject(Navigation())
            .environmentObject(Storage(food: Food.samples, recents: fruits))
    }
}
