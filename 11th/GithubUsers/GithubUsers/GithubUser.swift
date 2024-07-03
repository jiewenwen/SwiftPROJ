//
//  GithubUser.swift
//  GithubUsers
//
//  Created by Jiewen Wen on 2024/7/2.
//

//import Foundation
import SwiftUI
import Combine

struct GithubUser: Decodable, Identifiable{
    let id: Int
    let login: String
    let avatarUrl: String
}

class Github: ObservableObject{
    @Published var users:[GithubUser] = []
    private var cancellableSet: Set<AnyCancellable> = []
    
    func load(){
        let url = URL(string: "https://api.github.com/users")!
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        URLSession
            .shared
            .dataTaskPublisher(for: URLRequest(url:url))
            .map(\.data)
            .decode(type: [GithubUser].self, decoder: decoder)
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.users, on: self)
            .store(in: &cancellableSet)
    }
}
