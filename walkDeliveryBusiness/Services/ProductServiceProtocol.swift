//
//  ProductServiceProtocol.swift
//  walkDeliveryBusiness
//
//  Created by AndreyLebedev on 10/10/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import Foundation

enum ProductResult<U> {
	case Success(U)
	case Failure()
}

protocol ProductServiceProtocol: class {
	func create(_ product: Product, completionHandler: @escaping (ProductResult<Product>) -> Void)
	func getProducts(completionHandler: @escaping (ProductResult<[Product]>) -> Void)
}
