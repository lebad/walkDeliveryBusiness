//
//  RootViewControllerAccecable.swift
//  walkdelivery
//
//  Created by AndreyLebedev on 09/08/2017.
//  Copyright © 2017 lebedac. All rights reserved.
//

import UIKit

protocol RootViewControllerAccecable {
	var rootViewController: UIViewController? { get }
}

extension RootViewControllerAccecable {
	
	var rootViewController: UIViewController? {
		get {
			let appDelegate = UIApplication.shared.delegate as? AppDelegate
			let window = appDelegate?.window
			return window?.rootViewController
		}
	}
}
