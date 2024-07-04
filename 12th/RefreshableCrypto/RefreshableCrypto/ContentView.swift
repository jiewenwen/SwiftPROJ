//
//  ContentView.swift
//  RefreshableCrypto
//
//  Created by Jiewen Wen on 2024/7/4.
//

import SwiftUI

struct ContentView: View {
    private let service = Service()
    @State private var coins:[Coin] = []
    
    var body: some View {
        List(coins){
            CoinView(coin:$0)
        }
        .listStyle(.plain)
        .refreshable {
            coins = await service.fetchCoins()
        }
        .task {
            coins = await service.fetchCoins()
        }
    }
}

#Preview {
    ContentView()
}
