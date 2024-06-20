//
//  ContentView.swift
//  GradientViews
//
//  Created by Jiewen Wen on 2024/6/20.
//

import SwiftUI

extension Text{
    func bigLight() -> some View{
        font(.system(size: 80))
            .fontWeight(.thin)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
    }
}


struct ContentView: View {
    @State private var selectedGradient = 0
    @ViewBuilder var content: some View{
        switch selectedGradient{
        case 0:
            LinearGradientView()
        case 1:
            RadialGradientView()
        case 2:
            EllipticalGradientView()
        default:
            AngularGradientView()
        }
    }
    
    var body: some View {
        ZStack(alignment:.top){
            content
                .edgesIgnoringSafeArea(.all)
            
            Picker(selection: $selectedGradient, label: Text("Select Gradient")){
                Text("Linear")
                    .tag(0)
                Text("Radial")
                    .tag(1)
                Text("Elliptical")
                    .tag(2)
                Text("Angular")
                    .tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal,32)
        }
    }
}

#Preview {
    ContentView()
}
