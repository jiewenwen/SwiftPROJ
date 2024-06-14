//
//  Navigation.swift
//  ModernNavigation
//
//  Created by Jiewen Wen on 2024/6/10.
//

import Foundation
import SwiftUI

final class Navigation: ObservableObject{
//    @Published var path = [Food]()
//    
    @Published var path: NavigationPath = .init()

    func popToRoot(){
        path = .init() // back to the root view
    }
    
    
}
