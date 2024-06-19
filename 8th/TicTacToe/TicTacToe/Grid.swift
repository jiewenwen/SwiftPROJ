//
//  Grid.swift
//  TicTacToe
//
//  Created by Jiewen Wen on 2024/6/19.
//

import SwiftUI

struct Grid: View {
    @State var isNextNought: Bool = false
    
    var body: some View {
        ZStack{
            GridShape()
                .stroke(.indigo, lineWidth: 15)
            VStack{
                Row(isNextNought: $isNextNought)
                Row(isNextNought: $isNextNought)
                Row(isNextNought: $isNextNought)
            }
        }
        .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    Grid()
}
