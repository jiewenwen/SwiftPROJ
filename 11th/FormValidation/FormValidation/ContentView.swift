//
//  ContentView.swift
//  FormValidation
//
//  Created by Jiewen Wen on 2024/6/30.
//

import SwiftUI

struct CustomStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(height: 40)
            .background(Color.white)
            .cornerRadius(5)
    }
}

extension TextField{
    func custom() -> some View{
        modifier(CustomStyle())
            .autocapitalization(.none)
    }
}

extension SecureField{
    func custom() -> some View{
        modifier(CustomStyle())
    }
}

struct ContentView: View {
    @ObservedObject private var signupViewModel = SignupViewModel()
    
    var body: some View {
        ZStack{
            Color.yellow.opacity(0.2)
            VStack(spacing: 24){
                VStack(alignment: .leading){
                    Text(signupViewModel.usernameMessage)
                        .foregroundStyle(.red)
                    TextField("Username",text: $signupViewModel.username)
                        .custom()
                }
                
                VStack(alignment: .leading){
                    Text(signupViewModel.passwordMessage)
                        .foregroundStyle(.red)
                    SecureField("Password",text: $signupViewModel.password)
                        .custom()
                    SecureField("Repeat Password", text:$signupViewModel.confirmPassword)
                        .custom()
                }
                
                Button{
                    print("Succesfully registered")
                }label:{
                    Text("Register")
                        .foregroundStyle(.white)
                        .frame(width: 100,height: 44)
                        .background(signupViewModel.isValid ? Color.green:Color.red)
                        .cornerRadius(10)
                }
                .disabled(!signupViewModel.isValid)
            }
            .padding(.horizontal, 24)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
