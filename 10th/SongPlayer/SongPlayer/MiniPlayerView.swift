//
//  MiniPlayerView.swift
//  SongPlayer
//
//  Created by Jiewen Wen on 2024/6/24.
//

import SwiftUI

struct MiniPlayerView: View {
    @EnvironmentObject private var musicPlayer: MusicPlayer
    
    var body: some View {
        if let currentSong = musicPlayer.currentSong{
            SongView(song: currentSong)
                .padding(24)
        }else{
            EmptyView()
        }
    }
}

//#Preview {
//    MiniPlayerView()
//}
