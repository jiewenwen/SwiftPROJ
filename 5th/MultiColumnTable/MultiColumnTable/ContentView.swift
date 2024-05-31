//
//  ContentView.swift
//  MultiColumnTable
//
//  Created by Jiewen Wen on 2024/5/27.
//

import SwiftUI

struct ContentView: View {
    
    static let populationComparator = KeyPathComparator(\City.population, order: .reverse)
    @State private var cities: [City] = City.top20USCities.sorted(using: populationComparator)
    @State private var sortOrder = [populationComparator, KeyPathComparator(\City.state), KeyPathComparator(\City.name), KeyPathComparator(\City.area)]
    @State private var selection = Set<City.ID>()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    private var isCompact: Bool{ horizontalSizeClass == .compact}
    
    var body: some View {
        NavigationStack{
            //Table(cities, sortOrder: $sortOrder){
            Table(cities, selection: $selection, sortOrder: $sortOrder){
                TableColumn("name",value:\.name){city in
                    if isCompact{
                        CityRowView(city:city)
                    }else{
                        Text(city.name)
                    }
                }
                
                /**
                TableColumn("State",value:\.state)
                TableColumn("population", value: \.population){ city in
                    Text(city.formattedPopulation)
                        .font(.body.monospacedDigit())
                        .frame(minWidth: 100,alignment: .trailing)
                }
                .width(max:150)
                
                TableColumn("Area", value: \.area){ city in
                    Text(city.formattedArea)
                        .font(.body.monospacedDigit())
                        .frame(minWidth: 100, alignment: .trailing)
                }
                .width(max: 150)
                */
            }
            .navigationTitle("top 20 us cities")
            .onChange(of: sortOrder){ _, newOrder in
                cities.sort(using: newOrder)
            }
            .onChange(of:selection){
                print("Selected = { \(Array(selection).sorted().joined(separator: " | ")) }")
            }
        }
    }
}

#Preview {
    ContentView()
}
