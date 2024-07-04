//
//  PostsView.swift
//  FakePosts
//
//  Created by Jiewen Wen on 2024/7/4.
//

import SwiftUI

struct PostsView: View {
    private let service = PostService()
    @State private var posts: [Post] = []
    let user: User
    
    var body: some View {
        List(posts){ post in
            VStack(alignment: .leading){
                Text(post.title)
                    .font(.title3)
                    .foregroundStyle(.blue)
                Divider()
                    .background()
                Text(post.body)
                    .font(.subheadline)
            }
        }
        .navigationTitle(user.name)
        .task {
            posts = await service.fetchPosts(user: user)
        }
    }
}

//#Preview {
//    PostsView()
//}
