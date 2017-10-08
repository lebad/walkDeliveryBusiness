//
//  AppDelegate.swift
//  walkDeliveryBusiness
//
//  Created by andrey on 11/08/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
	var initialFlowInteractor: InitialFlowItemsInteractorInput?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		FIRApp.configure()
		
		initialFlowInteractor = InitialFlowItemsAssembly.configureInteractor()
		initialFlowInteractor?.startFlow()
		
		return true
	}
}

