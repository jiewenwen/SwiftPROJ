//
//  ContentView.swift
//  FocusAndSubmit
//
//  Created by Jiewen Wen on 2024/5/26.
//

import SwiftUI

struct ContentView: View {
    
    enum AddressField{
        case streetName
        case city
        case state
        case zipCode
    }
    @State private var streetName = ""
    @State private var city = ""
    @State private var state = ""
    @State private var zipCode = ""
    
    @FocusState private var currentFocus: AddressField?
    
    var body: some View {
        VStack {
            TextField("Address", text: $streetName)
                .focused($currentFocus,equals: .streetName)
                .submitLabel(.next)
            TextField("city", text: $city)
                .focused($currentFocus,equals: .city)
                .submitLabel(.next)
            TextField("State", text: $state)
                .focused($currentFocus,equals: .state)
                .submitLabel(.next)
            TextField("zipcode", text: $zipCode)
                .focused($currentFocus,equals: .zipCode)
                .submitLabel(.done)
        }
        .padding()
        .onSubmit {
            switch currentFocus {
            case .streetName:
                currentFocus = .city
            case .city:
                currentFocus = .state
            case .state:
                currentFocus = .zipCode
            default:
                print("thanks for providing your address")
            }
        }
    }
}

#Preview {
    ContentView()
}
