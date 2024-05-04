//
//  ContentView.swift
//  ListRowEdit
//
//  Created by Jiewen Wen on 2024/4/29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["USA", "Canada", "Mexico", "England",
    "Spain", "Cameroon", "South Africa" , "Japan", "South Korea"]

    var body: some View {
        NavigationStack{
            List{
                ForEach(countries, id:\.self){ country in
                Text(country)
                }
                .onMove(perform: moveRow)
            }
            .navigationTitle("Countries")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    EditButton()
                }
                
            }
        }
    }
    
    private func deleteItem(at indexSet: IndexSet){
        countries.remove(atOffsets: indexSet)
    }
    
    private func moveRow(source: IndexSet, destiantion: Int){
        countries.move(fromOffsets: source, toOffset: destiantion)
    }
}

#Preview {
    ContentView()
}
