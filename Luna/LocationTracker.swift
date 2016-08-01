//
//  LocationTracker.swift
//  Luna
//
//  Created by Zain Haq on 2016-07-31.
//  Copyright © 2016 Zain Haq. All rights reserved.
//

import Foundation
import CoreLocation

enum LocationError: ErrorType {
    case NoData
}

public struct Location {
    let physical: CLLocation
    let city: String
    let state: String
    let neighborhood: String
}

public typealias LocationResult = Result<Location>
public typealias Observer = (location: LocationResult) -> ()

class LocationTracke: NSObject, CLLocationManagerDelegate {
    private var lastResult: LocationResult = .Failure(LocationError.NoData)
    private var observers: [Observer] = []

    var currentLocation: LocationResult {
        return self.lastResult
    }

    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        return locationManager
    }()

    override init() {
        super.init()
        self.locationManager.startUpdatingLocation()
    }

    func addLocationChangeObserver(observer: Observer) {
        observers.append(observer)
    }

    // MARK: - CLLocationManagerDelegate

    internal func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .AuthorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }

    internal func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        let result = LocationResult.Failure(NetworkError.Other)
        self.lastResult = result
    }

    internal func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.first {
            if shouldUpdateWithLocation(currentLocation) {
                let location = Location(physical: currentLocation, city: "", state: "", neighborhood: "")

                let result = LocationResult.Success(location)
                self.publishChangeWithResult(result)
                self.lastResult = result
            }

            // location hasn't changed significantly
        }
    }

    // MARK: - Private

    private func shouldUpdateWithLocation(location: CLLocation) -> Bool {
        switch lastResult {
        case .Success(let loc):
            return location.distanceFromLocation(loc.physical) > 100
        case .Failure:
            return true
        }
    }

    private func publishChangeWithResult(result: LocationResult) {
        let _ = observers.map { (observer) -> Void in
            observer(location: result)
        }
    }

}
