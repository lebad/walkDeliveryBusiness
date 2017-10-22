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
	
	var products = [Product]()
	
	var taskProgressor: TaskProgressShowable?
	
	func add(_ product: Product) {
		taskProgressor?.showStart()
		productService?.create(product) { [weak self] result in
			switch result {
			case .Failure():
				self?.alertView?.show("Error occured")
			case .Success(_ ):
				self?.getProducts()
			}
			self?.taskProgressor?.showFinish()
		}
	}
	
	func viewPrepared() {
		self.getProducts()
	}
	
	private func getProducts() {
		taskProgressor?.showStart()
		productService?.getProducts() { [weak self] result in
			switch result {
			case .Failure():
				self?.alertView?.show("Error occured")
			case .Success(let products):
				self?.products = products
				self?.view?.show(products)
			}
			self?.taskProgressor?.showFinish()
		}
	}
}

extension AddProductsCoordinator: TableRepresentable {
	
	func numberOfRows() -> Int {
		return products.count
	}
	
	func viewModel(_ index: Int) -> ViewModelCellRepresentable {
		return products[index] as! ViewModelCellRepresentable
	}
	
	func didSelectRow(_ index: Int) {
		
	}
}
