//
//  WeatherService.swift
//  WeatherAppSWUI
//
//  Created by icelkas on 16/10/2021.
//

import Foundation


class WeatherService {
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=4da3c8088cc5b8fd7c21164accd791e4")
        else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            }else{
                completion(nil)
            }
        }.resume()
    }
}
