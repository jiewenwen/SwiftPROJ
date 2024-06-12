//
//  CategoryView.swift
//  ModernNavigation
//
//  Created by Jiewen Wen on 2024/6/10.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    
    var color: Color{
        switch category {
        case .meat:
                .red
        case .vegetable:
                .green
        case .fruit:
                .yellow
        }
    }
    
    var body: some View {
        Text(category.name)
            .foregroundStyle(.white)
            .padding(.all, 8)
            .background(color)
            .clipShape(Capsule())
    }
}

#Preview {
    VStack(spacing: 10){
        ForEach(Category.allCases){ category in
        CategoryView(category: category)
        }
    }
}
