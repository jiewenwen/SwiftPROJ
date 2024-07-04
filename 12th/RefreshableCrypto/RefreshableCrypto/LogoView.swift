//
//  LogoView.swift
//  RefreshableCrypto
//
//  Created by Jiewen Wen on 2024/7/4.
//

import SwiftUI

struct LogoView: View {
    let coin: Coin
    
    var body: some View {
        AsyncImage(url: URL(string: coin.logo)){image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 40, maxHeight:40)
            
        }placeholder: {
            ProgressView()
        }
    }
}

//#Preview {
//    LogoView()
//}
