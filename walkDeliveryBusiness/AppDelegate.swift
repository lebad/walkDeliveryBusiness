//
//  AppDelegate.swift
//  walkDeliveryBusiness
//
//  Created by andrey on 11/08/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import UIKit
import Firebase
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
	var initialFlowInteractor: InitialFlowItemsInteractorInput?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		FirebaseApp.configure()
		GMSServices.provideAPIKey("AIzaSyBaN9haHNytHcMCW6sov7t6nc1MUlJtn2s")
		
		initialFlowInteractor = InitialFlowItemsAssembly.configureInteractor()
		initialFlowInteractor?.startFlow()
		
		return true
	}
}

