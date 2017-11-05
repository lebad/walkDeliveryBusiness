//
//  MapInterface.swift
//  walkDeliveryBusiness
//
//  Created by andrey on 05/11/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import Foundation
import CoreLocation

protocol MapViewInput: class {
	func show(_ customerPosition: CLLocationCoordinate2D)
}

protocol MapViewOutput: ViewPreparable {
	
}
