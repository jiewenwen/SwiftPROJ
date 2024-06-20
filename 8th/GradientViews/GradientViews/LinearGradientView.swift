//
//  LinearGradientView.swift
//  GradientViews
//
//  Created by Jiewen Wen on 2024/6/20.
//

import SwiftUI

struct LinearGradientView: View {
    var body: some View {
        ZStack{
            LinearGradient(
            gradient: Gradient(colors: [.orange,.green,.blue,.black]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
            )
            
            Text("Linear Gradient")
                .bigLight()
        }
    }
}

#Preview {
    LinearGradientView()
}
