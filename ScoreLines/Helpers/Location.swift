//
//  Location.swift
//  Localist
//
//  Created by Steven Tran on 11/9/20.
//  Copyright © 2020 Localist. All rights reserved.
//

import Foundation
import CoreLocation

class LocationViewModel: NSObject, ObservableObject{
  
  @Published var userLatitude: String = "0"
  @Published var userLongitude: String = "0"
  @Published var cityName: String = "0"
  
  private let locationManager = CLLocationManager()
  
  override init() {
    super.init()
    self.locationManager.delegate = self
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    self.locationManager.requestWhenInUseAuthorization()
    self.locationManager.requestAlwaysAuthorization()
    
    if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways){
        self.retriveCurrentLocation()
    }
  }
    
    func retriveCurrentLocation(){
        let status = CLLocationManager.authorizationStatus()
        
        if(status == .denied || status == .restricted || !CLLocationManager.locationServicesEnabled()){
            return
        }
        
        // if haven't show location permission dialog before, show it to user
        if(status == .notDetermined){
            locationManager.requestWhenInUseAuthorization()
            
            // if you want the app to retrieve location data even in background, use requestAlwaysAuthorization
            locationManager.requestAlwaysAuthorization()
            return
        }
        
        // request location data for one-off usage
        locationManager.requestLocation()
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("location manager authorization status changed")
        
        switch status {
        case .authorizedAlways:
            print("user allow app to get location data when app is active or in background")
        case .authorizedWhenInUse:
            print("user allow app to get location data only when app is active")
        case .denied:
            print("user tap 'disallow' on the permission dialog, cant get location data")
        case .restricted:
            print("parental control setting disallow location data")
        case .notDetermined:
            print("the location permission dialog haven't shown before, user haven't tap allow/disallow")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // the last element is the most recent location
        if let location = locations.last {
            self.userLatitude = "\(location.coordinate.latitude)"
            self.userLongitude = "\(location.coordinate.longitude)"
            print(self.userLatitude)
            print(self.userLongitude)
            let geocoder = CLGeocoder()

            geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
                if error == nil {
                    if let firstLocation = placemarks?[0],
                        let cityName = firstLocation.locality { // sget the city name
                        self?.locationManager.stopUpdatingLocation()
                        self?.cityName = cityName
                    }
                }
            }
        }
        print(self.cityName)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}
