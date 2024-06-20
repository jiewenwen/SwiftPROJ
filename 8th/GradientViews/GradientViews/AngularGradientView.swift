//
//  AngularGradientView.swift
//  GradientViews
//
//  Created by Jiewen Wen on 2024/6/20.
//

import SwiftUI

struct AngularGradientView: View {
    var body: some View {
        ZStack{
            AngularGradient(
                gradient: Gradient(colors: [.orange,.green,.blue,.black,.black,.blue,.green,.orange]),
                center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
            )
            Text("Angular Gradient")
                .bigLight()
        }
    }
}

#Preview {
    AngularGradientView()
}
