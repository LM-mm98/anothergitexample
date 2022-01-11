//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Lin Myat on 10/20/21.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var temperatureLabel: UILabel!
    
    var presenter: ViewToPresenterProtocol?
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view. 
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            guard let currentLocation = locationManager.location else { return }
            self.currentLocation = currentLocation
            Location.shared.latitude = currentLocation.coordinate.latitude
            Location.shared.longitude = currentLocation.coordinate.longitude
            presenter?.fetchWeatherData()
        } 
    }
}

extension WeatherViewController: PresenterToViewProtocol {
    func updateMainUI(temperature: String) {
        temperatureLabel.text = temperature
    }
}

extension WeatherViewController {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            currentLocation = locationManager.location
            Location.shared.latitude = currentLocation.coordinate.latitude
            Location.shared.longitude = currentLocation.coordinate.longitude
        default: break
        }
    }
}
