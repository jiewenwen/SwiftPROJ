//
//  RowView.swift
//  TicTacToe
//
//  Created by Jiewen Wen on 2024/6/19.
//

import SwiftUI

struct Row: View {
    @Binding var isNextNought: Bool
    
    var body: some View {
        //Text( )
        HStack{
            Cell(isNextNought: $isNextNought)
            Cell(isNextNought: $isNextNought)
            Cell(isNextNought: $isNextNought)
        }
    }
}

//#Preview {
//    Row(isNextNought: true)
//}
