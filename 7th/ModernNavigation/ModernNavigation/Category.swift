//
//  Category.swift
//  ModernNavigation
//
//  Created by Jiewen Wen on 2024/6/6.
//

import Foundation

enum Category: Int, Identifiable, CaseIterable, Hashable{
    case meat
    case vegetable
    case fruit
    var id: Int{rawValue}
    
    var name: String{
        switch self{
        case .meat: "Meat"
        case .vegetable: "Vegetable"
        case .fruit: "Fruit"
        }
    }
}
