//
//  ContentView.swift
//  SongPlayer
//
//  Created by Jiewen Wen on 2024/6/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var musicPlayer: MusicPlayer
    private let songs = [
        Song(artist: "Luke", name: "99", cover: "cover0"),
        Song(artist: "Foxing", name: "No Trespassing", cover: "cover1"),
        Song(artist: "Breaking Benjamin", name: "Phobia", cover: "cover2"),
        Song(artist: "J2", name: "Solenoid", cover:"cover3"),
        Song(artist: "Wildflower Clothing", name: "Lightning Bottles", cover: "cover4"),
        Song(artist: "The Broken Spirits", name: "Rubble", cover: "cover5")
    ]
    
    var body: some View {
        ZStack(alignment: .bottom){
            NavigationStack{
                List(self.songs){song in
                    SongView(song: song)
                }
                .listStyle(.plain)
                .navigationTitle("Music Player")
            }
            
            MiniPlayerView()
                .background(.gray)
                .offset(y:44)
                .zIndex(1.0)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(MusicPlayer())
}
