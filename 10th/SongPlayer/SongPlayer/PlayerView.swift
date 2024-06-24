//
//  PlayerView.swift
//  SongPlayer
//
//  Created by Jiewen Wen on 2024/6/24.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject private var musicPlayer: MusicPlayer
    let song: Song
    
    var body: some View {
        VStack{
            Image(song.cover)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300,height: 300)
            HStack{
                Text(song.name)
                Text(song.artist).italic()
            }
            PlayButton(song: song)
        }
    }
}

//#Preview {
//    PlayerView()
//}
