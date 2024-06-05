//
//  ThirdView.swift
//  SimpleNavigation
//
//  Created by Jiewen Wen on 2024/6/5.
//

import SwiftUI

struct ThirdView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView{
            Image(systemName: "triangle")
                .font(.system(size: 80))
                .foregroundStyle(.teal)
                .padding(.vertical, 50)
            Text("this is the third view")
                .foregroundStyle(.primary)
                .padding()
        }
        .padding()
        .navigationTitle("third")
        .toolbarBackground(.quaternary, for: .navigationBar)
        //.navigationBarBackButtonHidden()
        .toolbar{
            Button("dismiss"){
                dismiss()
            }
        }
    }
}

#Preview {
    NavigationStack{
        ThirdView()
    }
}
