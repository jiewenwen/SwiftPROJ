//
//  Insect.swift
//  UsingMockDataForPreviews
//
//  Created by Jiewen Wen on 2024/5/24.
//

import Foundation

struct Insect: Decodable, Identifiable{
    var id: Int
    var imageName: String
    var name: String
    var habitat: String
    var description: String
}


