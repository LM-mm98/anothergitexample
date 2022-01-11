//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Lin Myat on 10/20/21.
//

import Foundation

class CurrentWeather: Codable {
    var temperature: Double?
    
    init(dict: [String: Any]) {
        self.temperature = dict["temp"] as? Double ?? 0.0
    }
}
