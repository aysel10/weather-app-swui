//
//  Weather.swift
//  WeatherAppSWUI
//
//  Created by icelkas on 16/10/2021.
//

import Foundation


struct WeatherResponse: Decodable {
    let main: Weather
    
}

struct Weather: Decodable {
    
    var temp: Double?
    var humidity: Double?
}
