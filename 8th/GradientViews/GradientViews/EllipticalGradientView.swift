//
//  EllipticalGradientView.swift
//  GradientViews
//
//  Created by Jiewen Wen on 2024/6/20.
//

import SwiftUI

struct EllipticalGradientView: View {
    var body: some View {
        ZStack{
            EllipticalGradient(
                gradient: Gradient(colors: [.orange,.green,.blue,.black]),
                center: .center,
                startRadiusFraction: 0,
                endRadiusFraction: 0.75
            )
            
            Text("Elliptical Gradient")
                .bigLight()
        }
    }
}

#Preview {
    EllipticalGradientView()
}
