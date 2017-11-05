//
//  AuthSceneRouter.swift
//  walkdelivery
//
//  Created by AndreyLebedev on 10/06/2017.
//  Copyright © 2017 lebedac. All rights reserved.
//

import UIKit

class AuthSceneRouter: AuthSceneRouterInput, RootViewControllerAccecable {
	
	func routeToNextScene() {
		guard let currentViewController = rootViewController else { return }
		
		let displayedItemsVC = AddProductAssembly.configureView()
		currentViewController.present(displayedItemsVC, animated: true)
	}
}
