//
//  MapViewController.swift
//  walkDeliveryBusiness
//
//  Created by andrey on 05/11/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
	
	var output: MapViewOutput?
	
	var mapView: GMSMapView = {
		let view = GMSMapView(frame: CGRect.zero)
		return view
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor.white
		setupMapView()
		output?.viewPrepared()
    }
	
	private func setupMapView() {
		mapView.translatesAutoresizingMaskIntoConstraints = false
		mapView.isMyLocationEnabled = true
		self.view.addSubview(mapView)
		mapView.snp.makeConstraints { make in
			make.size.equalToSuperview()
		}
	}
}

extension MapViewController: MapViewInput {
	
	func show(_ customerPosition: CLLocationCoordinate2D) {
		let camera = GMSCameraPosition.camera(withLatitude: customerPosition.latitude, longitude: customerPosition.longitude, zoom: 17.0)
		mapView.animate(to: camera)
	}
}
