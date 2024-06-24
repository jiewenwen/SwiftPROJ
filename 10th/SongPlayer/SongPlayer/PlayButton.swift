//
//  PlayButton.swift
//  SongPlayer
//
//  Created by Jiewen Wen on 2024/6/24.
//

import SwiftUI

struct PlayButton: View {
    @EnvironmentObject private var musicPlayer: MusicPlayer
    let song: Song
    
    private var buttonText: String{
        if song == musicPlayer.currentSong{
            return "stop"
        }else{
            return "play"
        }
    }
    
    var body: some View{
        Button{
            withAnimation{
                musicPlayer.tapButton(song: song)
            }
        }label:{
            Image(systemName: buttonText)
                .font(.system(.largeTitle))
                .foregroundStyle(.black)
        }
    }
}

//#Preview {
//    PlayButton()
//}
