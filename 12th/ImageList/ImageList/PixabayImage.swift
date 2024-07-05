//
//  PixabayImage.swift
//  ImageList
//
//  Created by Jiewen Wen on 2024/7/5.
//

import Foundation

struct PixabayImage: Identifiable, Codable, Equatable{
    let id: Int
    let tags: String
    let webformatURL: String
    let user: String
    var tagsList: [String]{
        tags.components(separatedBy: ", ")
    }
}

struct PixabayResponse: Codable{
    let images:[PixabayImage]
    
    enum CodingKeys:String, CodingKey{
        case images = "hits"
    }
}

struct PixabayService{
    private func searchImageUrl(page: Int) -> URL? {
        let api = "https://pixabay.com/api/"
        let apiKey = "44788695-aa6a5187c06cfb02b867f5e63"
        let q = "waterfall"
        let query = "?key=\(apiKey)&image_type=photo&orientation=horizontal&q=\(q)&per_page=10&page=\(page)"
        
        return URL(string: api + query)
    }
    
    func fetchImages(page: Int) async -> [PixabayImage]{
        guard let url = searchImageUrl(page:page) else {
            return []
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(PixabayResponse.self, from: data)
            return response.images
        }catch{
            print(error)
            return []
        }
    }
}
