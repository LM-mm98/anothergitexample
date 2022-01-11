//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Lin Myat on 10/20/21.
//

import Foundation

class WeatherPresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func fetchWeatherData() {
        interactor?.downloadWeatherDetail()
    }
}

extension WeatherPresenter: InteractorToPresenterProtocol {
    func completeDownload(temperature: String) {
        view?.updateMainUI(temperature: temperature)
    }
    
    
}
