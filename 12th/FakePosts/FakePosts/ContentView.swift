//
//  ContentView.swift
//  FakePosts
//
//  Created by Jiewen Wen on 2024/7/4.
//

import SwiftUI

struct ContentView: View {
    private  let service = PostService()
    @State private var users: [User] = []
    
    var body: some View {
        NavigationStack{
            List(users){user in
                NavigationLink(destination: PostsView(user: user)){
                    VStack(alignment: .leading){
                        Text(user.name)
                            .font(.title3)
                        Label(user.email, systemImage: "envelope")
                        Label(user.phone,systemImage: "phone")
                    }
                    .font(.footnote)
                }
            }
            .navigationTitle("Users")
        }
        .listStyle(.plain)
        .task {
            users = await service.fetchUsers()
        }
    }
}

#Preview {
    ContentView()
}
