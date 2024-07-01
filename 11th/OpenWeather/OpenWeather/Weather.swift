//
//  Weather.swift
//  OpenWeather
//
//  Created by Jiewen Wen on 2024/7/1.
//

import Foundation
import Combine

struct Weather: Decodable, Identifiable{
    var id: TimeInterval{ time.timeIntervalSince1970 }
    let time: Date
    let summary: String
    let icon: String
    let temperature: Double
    
    enum CodingKeys: String, CodingKey{
        case time = "dt"
        case weather = "weather"
        case summary = "description"
        case main = "main"
        case icon = "icon"
        case temperature = "temp"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        time = try container.decode(Date.self, forKey: .time)
        var weatherContainer = try container.nestedUnkeyedContainer(forKey: .weather)
        let weather = try weatherContainer.nestedContainer(keyedBy: CodingKeys.self)
        summary = try weather.decode(String.self, forKey: .summary)
        icon = try weather.decode(String.self, forKey: .icon)
        let main = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .main)
        temperature = try main.decode(Double.self, forKey: .temperature)
    }
}

struct ForecastWeather: Decodable{
    let list: [Weather]
}

class WeatherService: ObservableObject{
    @Published var errorMessage: String = ""
    @Published var current: Weather?
    @Published var forecast: [Weather] = []
    
    private let apiKey = "db1d38ea0c3a681752b6423f600e3305"
    private var cancellableSet: Set<AnyCancellable> = []
    
    func load(latitude: Float, longitude: Float){
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let currentURL = URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric")!
        URLSession
            .shared
            .dataTaskPublisher(for: URLRequest(url:currentURL))
            .map(\.data)
            .decode(type:Weather.self, decoder:decoder)
            .receive(on:RunLoop.main)
            .sink{completion in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }receiveValue:{
                self.current = $0
            }
            .store(in: &cancellableSet)
        
        let forecastURL = URL(string:"https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric")!
        URLSession
            .shared
            .dataTaskPublisher(for: URLRequest(url:forecastURL))
            .map(\.data)
            .decode(type:ForecastWeather.self, decoder:decoder)
            .receive(on:RunLoop.main)
            .sink{completion in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }receiveValue:{
                self.forecast = $0.list
            }
            .store(in: &cancellableSet) 
    }
}
