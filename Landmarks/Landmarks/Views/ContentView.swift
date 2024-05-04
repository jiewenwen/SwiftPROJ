//
//  ContentView.swift
//  Landmarks
//
//  Created by Jiewen Wen on 2024/1/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
