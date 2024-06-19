//
//  Cross.swift
//  TicTacToe
//
//  Created by Jiewen Wen on 2024/6/19.
//

import Foundation
import SwiftUI

struct CrossShape: Shape{
    func path(in rect: CGRect) -> Path{
        Path(){ path in
            path.move(to: CGPoint(x:rect.minX, y:rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct Cross: View {
    var body: some View {
        CrossShape()
            .stroke(.green,style: StrokeStyle(lineWidth: 10,lineCap: .round,lineJoin: .round))
    }
}

#Preview(){
    Cross()
}
