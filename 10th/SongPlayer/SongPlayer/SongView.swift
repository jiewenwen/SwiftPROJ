//
//  SongView.swift
//  SongPlayer
//
//  Created by Jiewen Wen on 2024/6/24.
//

import SwiftUI

struct SongView: View {
    @EnvironmentObject private var musicPlayer: MusicPlayer
    let song: Song
    
    var body: some View {
        HStack{
            NavigationLink(destination: PlayerView(song: song)){
                Image(song.cover)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100,height: 100)
                VStack(alignment: .leading){
                    Text(song.name)
                    Text(song.artist).italic()
                }
            }
            
            Spacer()
            PlayButton(song: song)
        }
        .buttonStyle(.plain)
    }
}
