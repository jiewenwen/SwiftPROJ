//
//  CityRowView.swift
//  MultiColumnTable
//
//  Created by Jiewen Wen on 2024/5/31.
//

import SwiftUI

struct CityRowView: View {
    var city: City
    var body: some View {
        VStack(alignment: .leading){
            LabeledContent{
                Text(city.state)
            }label:{
                Text(city.name)
                    .font(.title)
            }
            
            LabeledContent("Population"){
                Text(city.formattedPopulation)
                    .font(.body.monospacedDigit())
            }
            
            LabeledContent("Area"){
                Text(city.formattedArea)
                    .font(.body.monospacedDigit())
            }
        }
    }
}

#Preview {
    CityRowView(city: .top20USCities.first!)
        .padding()
}
