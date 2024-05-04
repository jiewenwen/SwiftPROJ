//
//  ContentView.swift
//  UsingViewModifiers
//
//  Created by Jiewen Wen on 2024/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Perfect")
            .backgroundStyle(color: Color.red)
    }
}

struct BackgroundStyle: ViewModifier{
    var bgColor: Color
    func body(content: Content) -> some View{
        content
            .frame(width: UIScreen.main.bounds.width * 0.3)
            .foregroundStyle(.black)
            .padding()
            .background(bgColor)
            .cornerRadius(20)
    }
}

extension View{
    func backgroundStyle(color: Color) -> some View{
        self.modifier(BackgroundStyle(bgColor: color))
    }
}

#Preview {
    ContentView()
}
