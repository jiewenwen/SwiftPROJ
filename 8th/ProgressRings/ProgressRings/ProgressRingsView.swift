//
//  ProgressRingsView.swift
//  ProgressRings
//
//  Created by Jiewen Wen on 2024/6/19.
//

import SwiftUI

struct ProgressRing: Shape{
    private let startAngle = Angle.radians(1.5 * .pi)
    var progress: Double
    
    func path(in rect: CGRect) -> Path {
        Path(){ path in
            path.addArc(center: CGPoint(x:rect.midX,y:rect.midY), radius: rect.width/2, startAngle: startAngle, endAngle: startAngle + Angle(radians: 2 * .pi * progress), clockwise: false)
        }
    }
}

struct ProgressRingsView: View {
    private let ringPadding = 5.0
    private let ringWidth = 40.0
    private var ringStrokeStyle: StrokeStyle{
        .init(lineWidth: ringWidth,lineCap: .round, lineJoin: .round)
    }
    
    var progressExternal: Double
    var progressCentral: Double
    var progressInternal: Double
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ZStack{
            ProgressRing(progress: progressInternal)
                .stroke(.blue,style: ringStrokeStyle)
                .padding(2*(ringWidth + ringPadding))
            ProgressRing(progress: progressCentral)
                .stroke(.red, style: ringStrokeStyle)
                .padding(ringWidth+ringPadding)
            ProgressRing(progress: progressExternal)
                .stroke(.green,style: ringStrokeStyle)
        }
        .padding(ringWidth)
    }
}

#Preview {
    ProgressRingsView(progressExternal: 0.3, progressCentral: 0.7, progressInternal: 0.5)
}
