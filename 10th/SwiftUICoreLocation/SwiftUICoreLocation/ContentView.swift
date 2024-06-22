//
//  ContentView.swift
//  SwiftUICoreLocation
//
//  Created by Jiewen Wen on 2024/6/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager: LocationManager
    var body: some View {
        VStack{
            Text("Status: \(locationManager.status.description)")
            
            HStack{
                Text("Latitude:\(locationManager.current.latitudeDescription)")
                Text("Longtitude:\(locationManager.current.longitudeDescription)")
            }
        }
    }
}

#Preview {
    ContentView(locationManager: LocationManager())
}
