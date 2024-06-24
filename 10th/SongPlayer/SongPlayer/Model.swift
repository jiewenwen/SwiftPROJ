//
//  Model.swift
//  SongPlayer
//
//  Created by Jiewen Wen on 2024/6/23.
//

import Foundation

struct Song: Identifiable, Equatable{
    var id = UUID()
    let artist: String
    let name: String
    let cover: String
}

class MusicPlayer: ObservableObject{
    @Published var currentSong: Song?
    
    func tapButton(song: Song){
        if currentSong == song{
            currentSong = nil
        }else{
            currentSong = song
        }
    }
}
