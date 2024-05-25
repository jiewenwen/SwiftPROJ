//
//  ContentView.swift
//  FormattedText
//
//  Created by Jiewen Wen on 2024/4/19.
//

import SwiftUI

struct ContentView: View {
    
    @State private var password = "1234"
    @State private var someText = "initial text"
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .fontWeight(.medium)
            SecureField("Enter a password", text: $password)
                .padding()
            Text("password entered: \(password)")
                .italic()
            TextField("Enter some Text", text: $someText)
                .padding()
            Text(someText)
                .font(.largeTitle)
                .underline()
            Text("Changing text color and make ut bold")
                .foregroundStyle(.blue)
                .bold()
            Text("Use kerning change space between characters in the text")
                .kerning(7)
            Text("Changing baseline offset")
                .baselineOffset(100)
            Text("Strikethrough")
                .strikethrough()
            Text("this is a multiline text implemented in SwiftUI,the trailing  modifier was added to the text, this text also implenents multiple modifiers")
                .background(.yellow)
                .multilineTextAlignment(.trailing)
                .lineSpacing(10)
            
        }
    }
}

#Preview {
    ContentView()
}
