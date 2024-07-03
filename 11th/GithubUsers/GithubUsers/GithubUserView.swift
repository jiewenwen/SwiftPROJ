//
//  GithubUserView.swift
//  GithubUsers
//
//  Created by Jiewen Wen on 2024/7/2.
//

import SwiftUI

struct GithubUserView: View {
    let user: GithubUser
    
    var body: some View {
        HStack{
            AsyncImage(url:URL(string: user.avatarUrl)){ image in
                image
                    .resizable()
                    .scaledToFill()
            }placeholder: {
                Color.purple.opacity(0.1)
            }
            .frame(width: 40,height: 40)
            .cornerRadius(20)
            Spacer()
            Text(user.login)
        }
    }
}

//#Preview {
//    GithubUserView(user: user)
//}

