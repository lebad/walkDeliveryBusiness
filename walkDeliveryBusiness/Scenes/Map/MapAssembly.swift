//
//  MapAssembly.swift
//  walkDeliveryBusiness
//
//  Created by andrey on 05/11/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import UIKit

class MapAssembly: ViewConfigurable {
	
	static func configureView() -> UIViewController {
		let mapViewController = MapViewController()
		let coordinator = MapCoordinator()
		coordinator.locationManager = LocationManager.singleton
		coordinator.updateLocationService = UpdateLocationService()
		mapViewController.output = coordinator
		coordinator.view = mapViewController
		return mapViewController
	}
}
