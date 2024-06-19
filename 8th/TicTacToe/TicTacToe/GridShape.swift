//
//  Path.swift
//  TicTacToe
//
//  Created by Jiewen Wen on 2024/6/19.
//

import Foundation
import SwiftUI

struct GridShape: Shape{
    func path(in rect: CGRect) -> Path{
        Path(){ path in
            path.move(to: CGPoint(x: rect.width/3, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.width/3, y: rect.maxY))
            path.move(to: CGPoint(x: 2 * rect.width/3, y: rect.minY))
            path.addLine(to: CGPoint(x: 2 * rect.width/3, y: rect.maxY))
            path.move(to: CGPoint(x: rect.minX, y: rect.height/3))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.height/3))
            path.move(to: CGPoint(x: rect.minX, y: 2 * rect.height/3))
            path.addLine(to: CGPoint(x: rect.maxX, y: 2 * rect.height/3))
        }
    }
}
