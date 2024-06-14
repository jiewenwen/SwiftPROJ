//
//  FoodView.swift
//  ModernNavigation
//
//  Created by Jiewen Wen on 2024/6/10.
//

import SwiftUI

struct FoodView: View {
    var food: Food
    @EnvironmentObject private var storage: Storage
    @EnvironmentObject private var navigation: Navigation

    
    var body: some View {
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
                            NavigationLink(value: recent){
                                FoodRowView(food: recent)
                            }
                            .disabled(recent == food)
                        }
                    }
                }
                .listStyle(.grouped)
            }
                
        }
        .navigationTitle(food.name)
        .toolbar{
            Button{
                storage.toggleFavorite(food)
            }label:{
                if storage.isFavorites(food){
                    Image(systemName: "minus.square")
                }else{
                    Image(systemName: "plus.square")
                }
            }
            
            Button{
                navigation.popToRoot()
            }label: {
                Image(systemName: "list.bullet")
            }
        }
        .onDisappear{
            storage.addRecents(food)
        }
    }
}

#Preview {
    let fruits = Array(Food.samples.prefix(4))
    return NavigationStack{
        FoodView(food:fruits.first!)
            .environmentObject(Navigation())
            .environmentObject(Storage(food: Food.samples, recents: fruits))
    }
}
