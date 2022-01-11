//
//  WeatherProtocol.swift
//  WeatherApp
//
//  Created by Lin Myat on 10/20/21.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol {
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    func fetchWeatherData()
}

protocol PresenterToViewProtocol {
    var presenter: ViewToPresenterProtocol? { get set }
    func updateMainUI(temperature: String)
}

protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? { get set }
    func downloadWeatherDetail()
}

protocol InteractorToPresenterProtocol {
    func completeDownload(temperature: String)
}

protocol PresenterToRouterProtocol {
    static func createModule() -> UIViewController
}
