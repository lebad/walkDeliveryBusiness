//
//  MapCoordinator.swift
//  walkDeliveryBusiness
//
//  Created by andrey on 05/11/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import Foundation
import CoreLocation

class MapCoordinator: MapViewOutput {
	
	weak var view: MapViewInput?
	weak var alertView: AlertShowable?
	var taskProgressor: TaskProgressShowable?
	
	var updateLocationService: UpdateLocationServiceProtocol?
	weak var locationManager: LocationManagerInput?
	
	func viewPrepared() {
		locationManager?.addObserver(observer: self)
		locationManager?.startUpdatingLocation()
	}
}

extension MapCoordinator: LocationManagerObserver {
	
	func didUpdate(_ location: CLLocationCoordinate2D) {
		updateLocationService?.update(location) { [unowned self] result in
			switch result {
			case .success:
				print("location sent: \(location)")
				self.view?.show(location)
			default:
				break
			}
		}
	}
	
	func didAuthFail() {
		
	}
}
