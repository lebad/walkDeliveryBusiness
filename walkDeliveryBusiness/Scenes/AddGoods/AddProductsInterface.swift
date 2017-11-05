//
//  AddProductsInterface.swift
//  walkDeliveryBusiness
//
//  Created by AndreyLebedev on 22/10/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import Foundation

protocol AddProductsViewInput: class {
	func show(_ products:[Product])
}

protocol AddProductsViewOutput: ViewPreparable {
	func add(_ product: Product)
}
