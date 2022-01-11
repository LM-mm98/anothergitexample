//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created by Lin Myat on 10/20/21.
//

import Foundation
import UIKit

class WeatherRouter: PresenterToRouterProtocol {
    static func createModule() -> UIViewController {
        let view = WeatherViewController(nibName: "WeatherViewController", bundle: nil)
        
        var presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = WeatherPresenter()
        var interactor: PresenterToInteractorProtocol = WeatherInteractor()
        let router: PresenterToRouterProtocol = WeatherRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    
}
