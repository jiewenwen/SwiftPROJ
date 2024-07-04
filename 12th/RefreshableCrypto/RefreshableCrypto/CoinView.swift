//
//  CoinView.swift
//  RefreshableCrypto
//
//  Created by Jiewen Wen on 2024/7/4.
//

import SwiftUI

struct CoinView: View {
    let coin:Coin
    
    var body: some View {
        HStack{
            Text("\(coin.acronym): \(coin.coinName)")
            Spacer()
            LogoView(coin: coin)
        }
    }
}

//#Preview {
//    CoinView()
//}
