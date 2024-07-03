//
//  ContentView.swift
//  GithubUsers
//
//  Created by Jiewen Wen on 2024/7/2.
//

import SwiftUI

struct ContentView: View {
    @StateObject var github = Github()
    
    var body: some View {
        List(github.users){
            GithubUserView(user: $0)
        }
        .task {
            github.load()
        }
    }
}

#Preview {
    ContentView()
}
