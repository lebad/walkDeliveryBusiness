//
//  UpdateLocationServiceProtocol.swift
//  walkDeliveryBusiness
//
//  Created by andrey on 05/11/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import Foundation
import CoreLocation

enum UpdateLocationResult {
	case success
	case failure
}

protocol UpdateLocationServiceProtocol: class {
	func update(_ location: CLLocationCoordinate2D, completionHandler: @escaping (UpdateLocationResult) -> Void)
}
