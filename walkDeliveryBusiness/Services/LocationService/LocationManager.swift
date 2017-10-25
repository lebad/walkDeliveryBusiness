//
//  LocationManager.swift
//  walkDeliveryBusiness
//
//  Created by AndreyLebedev on 25/10/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
	
	static var singleton = LocationManager()
	
	private lazy var locationManager: CLLocationManager = {
		let locManager = CLLocationManager()
		return locManager
	}()

	func requestAuthorization() {
		locationManager.requestWhenInUseAuthorization()
		locationManager.delegate = self
	}
}

extension LocationManager: CLLocationManagerDelegate {
	
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		
	}
}
