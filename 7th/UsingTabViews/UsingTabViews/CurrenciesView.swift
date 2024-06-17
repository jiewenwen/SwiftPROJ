//
//  CurrenciesView.swift
//  UsingTabViews
//
//  Created by Jiewen Wen on 2024/6/17.
//

import SwiftUI

struct CurrenciesView: View {
    var body: some View {
        NavigationStack{
            VStack{
                ForEach(Currency.currencies){currency in
                    HStack{
                        Text(currency.name)
                        Spacer()
                        Image(systemName: currency.image)
                    }
                    .font(Font.system(size: 32, design: .default))
                    .padding()
                }
                .navigationTitle("currencies")
            }
        }
    }
}

#Preview {
    CurrenciesView()
}
