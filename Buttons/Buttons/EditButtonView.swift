//
//  EditButtonView.swift
//  Buttons
//
//  Created by Jiewen Wen on 2024/4/23.
//

import SwiftUI

struct EditButtonView: View {
    @State private var animals = ["Cats","Dogs","Goats"]
    var body: some View {
        List{
            ForEach(animals,id:\.self){ animals in
                Text(animals)
            }
           .onDelete(perform: removeAnimal)
        }
        .toolbar{
            EditButton()
        }
        .navigationTitle("EditButtonView")
    }
    
    func removeAnimal(at offsets: IndexSet){
        animals.remove(atOffsets: offsets)
    }
    
}
#Preview {
    NavigationStack{
        EditButtonView()
    }
}
