//
//  RadialGradientView.swift
//  GradientViews
//
//  Created by Jiewen Wen on 2024/6/20.
//

import SwiftUI

struct RadialGradientView: View {
    var body: some View {
        ZStack{
            RadialGradient(
                gradient: Gradient(colors: [.orange,.green,.blue,.black]),
                center: .center,
                startRadius: 20,
                endRadius:500
            
            )
            Text("Radial Gradient")
                .bigLight()
        }
    }
}

#Preview {
    RadialGradientView()
}
