//
//  Model.swift
//  RefreshableCrypto
//
//  Created by Jiewen Wen on 2024/7/4.
//

import Foundation

struct Coin: Decodable, Identifiable{
    let id: Int
    let coinName: String
    let acronym: String
    let logo: String
}

struct Service{
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func fetchCoins() async -> [Coin]{
        guard let url = URL(string: "https://random-data-api.com/api/crypto_coin/random_crypto_coin?size=10") else{
            return []
        }
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            let list = try decoder.decode([Coin].self, from: data)
            return list.sorted{
                $0.acronym < $1.acronym
            }
        }catch{
            return []
        }
    }
}
