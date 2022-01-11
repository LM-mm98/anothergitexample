//
//  Location.swift
//  WeatherApp
//
//  Created by Lin Myat on 10/20/21.
//

import Foundation

class Location {
    static var shared = Location()
    private init() { }
    var latitude: Double!
    var longitude: Double!
}
