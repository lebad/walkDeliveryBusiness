//
//  AddProductAssembly.swift
//  walkDeliveryBusiness
//
//  Created by AndreyLebedev on 22/10/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import UIKit

class AddProductAssembly: ViewConfigurable {
	
	static func configureView() -> UIViewController {
		let viewController = AddProductsViewController()
		let coordinator = AddProductsCoordinator()
		coordinator.productService = ProductsService()
		viewController.output = coordinator
		viewController.tableRepresentable = coordinator
		coordinator.view = viewController
		coordinator.alertView = viewController
		coordinator.taskProgressor = viewController
		return viewController
	}
}
