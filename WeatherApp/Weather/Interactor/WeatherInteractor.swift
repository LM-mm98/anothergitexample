//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Lin Myat on 10/20/21.
//

import Foundation

class WeatherInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
//    var currentWeather = CurrentWeather()
    
    func downloadWeatherDetail() {
         
        guard let url = URL(string: CURRENT_WEATHER_URL) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "post"
         
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                        if let main = json["main"] as? [String: Any] {
                            if let currentTemp = main["temp"] as? Double {
                              
                                let kelvinToFarenheitPreDivision = (currentTemp * (9/5) - 459.67)
                                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                                
                                let currentTemp = "\(kelvinToFarenheit)°F"
                                 
                                DispatchQueue.main.async {
                                    self.presenter?.completeDownload(temperature: currentTemp)
                                }
                           }
                        }
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
        
//        presenter?.completeDownload()
    }
}
