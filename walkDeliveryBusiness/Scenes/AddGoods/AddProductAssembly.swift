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
		let addProductsViewController = configureAddProductsViewController()
		addProductsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
		let mapViewController = MapViewController()
		mapViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
		let tabBarViewController = UITabBarController()
		let viewControllers = [addProductsViewController, mapViewController]
		tabBarViewController.viewControllers = viewControllers.map{UINavigationController(rootViewController: $0)}
		return tabBarViewController
	}
	
	private static func configureAddProductsViewController() -> UIViewController {
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
