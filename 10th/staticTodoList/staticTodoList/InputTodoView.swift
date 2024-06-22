//
//  InputTodoView.swift
//  staticTodoList
//
//  Created by Jiewen Wen on 2024/6/22.
//

import SwiftUI

struct InputTodoView: View {
    @State private var newTodoDescription: String = ""
    @Binding var todos:[Todo]
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        HStack{
            TextField("Todo", text:$newTodoDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            Button{
                todos.append(Todo(description: newTodoDescription, done: false))
                newTodoDescription = ""
            }label:{
                Text("Add")
                    .padding(.horizontal, 16)
                    .padding(.vertical,8)
                    .foregroundStyle(.white)
                    .background(.green)
                    .cornerRadius(5)
            }
        }
        .frame(height: 60)
        .padding(.horizontal,24)
        .padding(.bottom, 30)
        .background(Color.gray)
    }
}

//#Preview {
//    InputTodoView(todos: Todo(description: "Test", done: false))
//}
