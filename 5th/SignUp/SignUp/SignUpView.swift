//
//  SignUpView.swift
//  SignUp
//
//  Created by Jiewen Wen on 2024/5/25.
//

import SwiftUI

struct Address{
    var street: String = ""
    var city: String = ""
    var postalCode: String = ""
}

struct SignUpView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var address = Address()
    @State private var address2 = Address()
    @State private var lessThanTwo = false
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationStack{
            Form{
                Section("Names"){
                    TextField("First name", text:$firstName)
                    TextField("last name", text: $lastName)
                }
                
                Section("Current Address"){
                    TextField("street address", text: $address.street)
                    TextField("city", text: $address.city)
                    TextField("postal code", text:$address.postalCode)
                    
                    Toggle(isOn: $lessThanTwo){
                        Text("Have you lived here for 2+ years")
                    }
                    if !lessThanTwo{
                        Section("previous address"){
                            TextField("street address", text: $address2.street)
                            TextField("city", text: $address2.city)
                            TextField("postal code", text:$address2.postalCode)
                        }
                    }
                    
                }
                
                Section("user"){
                    TextField("create username", text: $username)
                    SecureField("create password", text:$password)
                }
                
                Button("submit"){
                    print("form submit action here")
                }
            }
        }
        .navigationTitle("Sign up")
    }
}

#Preview {
    SignUpView()
}
