//
//  ContentView.swift
//  EditableListsFields
//
//  Created by Jiewen Wen on 2024/4/30.
//

import SwiftUI

struct TodoItem: Identifiable{
    let id = UUID()
    var title: String
}

struct ContentView: View {
    
    @State private var todos = [
        TodoItem(title: "Eat"),
        TodoItem(title: "Sleep"),
        TodoItem(title: "Code")
    ]
    
    var body: some View {
        VStack {
            List($todos){$todo in
                TextField("Todo Item", text: $todo.title)
            }
        }
    }
}

#Preview {
    ContentView()
}
