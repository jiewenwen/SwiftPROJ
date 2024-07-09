//
//  ContentView.swift
//  RemoteConfig
//
//  Created by Jiewen Wen on 2024/7/9.
//

import SwiftUI
import Firebase
import FirebaseRemoteConfigSwift
import FirebaseRemoteConfigInternal

struct ContentView: View {
    private var config = RemoteConfiguration()
    @RemoteConfigProperty(key: "screenType", fallback: nil) var screenType: String?
    
    private var image:(name: String, color: Color){
        if screenType == "screenA"{
            ("a.square", .green)
        }else if screenType == "screenB"{
            ("b.square", .blue)
        }else{
            ("questionmark.square", .red)
        }
    }
    
    var body: some View {
        VStack{
            if screenType != nil{
                Image(systemName: image.name)
                    .foregroundStyle(image.color)
                    .font(.system(size: 258))
            }else{
                ProgressView()
                    .controlSize(.large)
            }
        }
        .task {
            await config.fetchFromServer()
            config.registerForRealtimeUpdates()
        }
    }
}

class RemoteConfiguration{
    private var remoteConfig = FirebaseRemoteConfigInternal.RemoteConfig.remoteConfig()
    
    init(){
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    
    private func activate(){
        remoteConfig.activate{change, error in
            guard error == nil else{
                print("Error activating Remote config:\(error!.localizedDescription)")
                return
            }
            print("default values were \(change ? "" : "NOT") updated from Remote Config")
            
        }
    }
    
    func fetchFromServer() async{
        guard let status = try? await remoteConfig.fetch(), status == .success else{
            print("couldnt fetch remote config")
            return
        }
        print("Remote config successfully fetch")
        activate()
    }
    
    func registerForRealtimeUpdates() {
        print("Registering for Remote Config realtime updates")
        remoteConfig.addOnConfigUpdateListener { [self] update, error in
            guard let update, error == nil else {
                print("Error listening for Remote Config realtime updates: \(error!.localizedDescription)")
                return
            }
            print("Updated keys in realtime: \(update.updatedKeys)")
            activate()
        }
    }
}

#Preview {
    ContentView()
}
