//
//  WeatherViewModel.swift
//  WeatherAppSWUI
//
//  Created by icelkas on 16/10/2021.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    private var weatherService: WeatherService
    
    @Published var weather = Weather()
    
    init() {
        self.weatherService = WeatherService()
    }
    
    var temperature: String {
        if let humidity = self.weather.temp {
            return String(format: "%.0f", humidity)
        }else {
            return ""
        }
    }
    
    var cityName: String = ""
    func search(){
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeather(city: city)
        }
    }
    
    private func fetchWeather(city: String) {
        
        self.weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                    print(self.weather.humidity)
                }
                
            }
        }
    }
}
