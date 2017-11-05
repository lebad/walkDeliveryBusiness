//
//  MapViewController.swift
//  walkDeliveryBusiness
//
//  Created by andrey on 05/11/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
	
	var output: MapViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor.white
		
		output?.viewPrepared()
    }
}

extension MapViewController: MapViewInput {
	
}
