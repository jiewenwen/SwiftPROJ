//
//  model.swift
//  FakePosts
//
//  Created by Jiewen Wen on 2024/7/4.
//

import Foundation

struct User: Decodable, Identifiable{
    let id: Int
    let name: String
    let email: String
    let phone: String
}

struct Post: Decodable, Identifiable{
    let id: Int
    let title: String
    let body: String
    let userID: Int
}

struct PostService{
    private func fetch<T: Decodable>(type: T.Type, from urlString: String) async -> T?{
        guard let url = URL(string: urlString) else{
            return nil
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(type, from: data)
        }catch{
            return nil
        }
    }
    
    func fetchUsers() async -> [User]{
        await fetch(type:[User].self, from: "https://jsonplaceholder.typicode.com/users") ?? []
    }
    
    func fetchPosts(user:User) async -> [Post]{
        await fetch(type: [Post].self, from: "https://jsonplaceholder.typicode.com/posts?userId=\(user.id)") ?? []
    }
}
