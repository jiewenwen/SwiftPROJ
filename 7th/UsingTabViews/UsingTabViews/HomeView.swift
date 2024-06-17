//
//  HomeView.swift
//  UsingTabViews
//
//  Created by Jiewen Wen on 2024/6/17.
//

import SwiftUI

struct HomeView: View {
    let games = ["Doom", "Final F","Cyberpunk", "avengers", "animal trivia", "sudoku", "snakes and ladders", "Power rangers", "ultimate frisbee", "football", "soccer", "much more"]
    var body: some View {
        NavigationStack{
            List{
                ForEach(games, id:\.self){ game in
                    Text(game)
                        .padding()
                }
            }
            .navigationTitle("best games for 2021")
        }
    }
}

#Preview {
    HomeView()
}
