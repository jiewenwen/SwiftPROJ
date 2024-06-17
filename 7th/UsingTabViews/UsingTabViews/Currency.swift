//
//  Currency.swift
//  UsingTabViews
//
//  Created by Jiewen Wen on 2024/6/17.
//

import Foundation

struct Currency: Identifiable{
    let id = UUID()
    var name:String
    var image:String
}

extension Currency{
    static var currencies = [
        Currency(name: "Dollar", image: "dollarsign.circle.fill"),
        Currency(name: "Sterling", image: "sterlingsign.circle.fill"),
        Currency(name: "Euro", image: "eurosign.circle.fill"),
        Currency(name: "Yen", image: "yensign.circle.fill"),
        Currency(name: "Naira", image: "nairasign.circle.fill")
        ]
}
