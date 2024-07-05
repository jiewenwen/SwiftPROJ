//
//  ContentView.swift
//  ImageList
//
//  Created by Jiewen Wen on 2024/7/5.
//

import SwiftUI

struct ContentView: View {
    private let service = PixabayService()
    @State private var pixabayImages:[PixabayImage] = []
    @State private var page = 1
    
    var body: some View {
        List(pixabayImages){pixabayImage in
            VStack(alignment: .leading){
                AsyncImage(url: URL(string: pixabayImage.webformatURL)){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10.0, height: 10.0)))
                }placeholder: {
                    Image(systemName: "photo.artframe")
                        .resizable()
                        .foregroundStyle(.quaternary)
                        .aspectRatio(contentMode: .fit)
                }
                
                HStack{
                    ForEach(pixabayImage.tagsList, id: \.self){tag in
                    Text(tag)
                            .font(.caption2)
                            .padding(7.0)
                            .foregroundStyle(.black)
                            .background(.yellow)
                            .clipShape(Capsule())
                    }
                    Spacer()
                    Text("by \(pixabayImage.user) via Pixabay")
                        .font(.caption2)
                        .italic()
                }
            }
            .task {
                if pixabayImage == pixabayImages.last{
                    page += 1
                    pixabayImages += await service.fetchImages(page: page)
                }
            }
        }
        .listStyle(.plain)
        .task {
            pixabayImages = await service.fetchImages(page: page)
        }

    }
}

#Preview {
    ContentView()
}
