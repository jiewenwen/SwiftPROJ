//
//  Cell.swift
//  TicTacToe
//
//  Created by Jiewen Wen on 2024/6/19.
//

import SwiftUI

struct Cell: View {
    enum CellType{
        case hidden
        case nought
        case cross
    }
    
    @State private var type: CellType = .hidden
    @Binding var isNextNought: Bool
    
    @ViewBuilder
    private var content: some View{
        switch type{
        case .hidden:
            Color.clear
        case .nought:
            Nought()
        case .cross:
            Cross()
        }
    }
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        content
            .padding(20)
            .contentShape(Rectangle())
            .onTapGesture {
                guard type == .hidden else {
                    return
                }
                type = isNextNought ? .nought : .cross
                isNextNought.toggle()
            }
    }
}

//#Preview {
//    Cell(isNextNought: true )
//}
