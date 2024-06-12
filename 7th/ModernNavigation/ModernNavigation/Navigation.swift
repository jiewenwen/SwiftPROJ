//
//  Navigation.swift
//  ModernNavigation
//
//  Created by Jiewen Wen on 2024/6/10.
//

import Foundation

final class Navigation: ObservableObject{
    @Published var path = [Food]()
    
    func popToRoot(){
        path = .init() // back to the root view
    }
}
