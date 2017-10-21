//
//  AddProductsCoordinator.swift
//  walkDeliveryBusiness
//
//  Created by AndreyLebedev on 21/10/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import Foundation

class AddProductsCoordinator: AddProductsViewOutput {
	
	var productService: ProductServiceProtocol?
	weak var view: AddProductsViewInput?
	weak var alertView: AlertShowable?
	
	var taskProgressor: TaskProgressShowable?
	
	func add(_ product: Product) {
		taskProgressor?.showStart()
		productService?.create(product) { [weak self] result in
			switch result {
			case .Failure():
				self?.alertView?.show("Error occured")
			case .Success(_ ):
				return
			}
		}
	}
}
