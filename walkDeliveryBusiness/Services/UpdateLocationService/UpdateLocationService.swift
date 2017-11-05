//
//  UpdateLocationService.swift
//  walkDeliveryBusiness
//
//  Created by andrey on 05/11/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import CoreLocation
import GeoFire

class UpdateLocationService: UpdateLocationServiceProtocol {
	
	private var fireBaseReference = Database.database().reference()
	private var firAuth: Auth? = {
		let auth = Auth.auth()
		return auth
	}()
	
	func update(_ location: CLLocationCoordinate2D, completionHandler: @escaping (UpdateLocationResult) -> Void) {
		guard let userUID = firAuth?.currentUser?.uid else {
			completionHandler(.failure)
			return
		}
		
		let reference = fireBaseReference.child("consumersInfo").child(userUID)
		let geofire = GeoFire(firebaseRef: reference)
		let locationToSend = CLLocation(latitude: location.latitude, longitude: location.longitude)
		geofire?.setLocation(locationToSend, forKey: "location") { error in
			if error != nil {
				completionHandler(.failure)
			} else {
				completionHandler(.success)
			}
		}
	}
}
