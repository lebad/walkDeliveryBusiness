//
//  ViewConfigurable.swift
//  walkDeliveryBusiness
//
//  Created by AndreyLebedev on 22/10/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import UIKit

protocol ViewConfigurable: class {
	static func configureView() -> UIViewController
}
