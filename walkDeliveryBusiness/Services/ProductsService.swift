//
//  ProductsService.swift
//  walkDeliveryBusiness
//
//  Created by AndreyLebedev on 10/10/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import SwiftyJSON

class ProductsService: ProductServiceProtocol {
	
	private var fireBaseReference = FIRDatabase.database().reference()
	private var firAuth: FIRAuth? = {
		let auth = FIRAuth.auth()
		return auth
	}()
	
	func create(_ product: Product, completionHandler: @escaping (ProductResult<Product>) -> Void) {
		guard let userUID = firAuth?.currentUser?.uid else {
			completionHandler(.Failure())
			return
		}
		
		let productDict = product.convertToDict()
		fireBaseReference.child("productsBySellers").child(userUID).childByAutoId().setValue(productDict) { error, firebaseReference in
			guard error == nil else {
				completionHandler(.Failure())
				return
			}
			completionHandler(.Success(product))
		}
	}
	
	func getProducts(completionHandler: @escaping (ProductResult<[Product]>) -> Void) {
		guard let userUID = firAuth?.currentUser?.uid else {
			completionHandler(.Failure())
			return
		}
		
		fireBaseReference.child("productsBySellers").child(userUID).observeSingleEvent(of: .value, with: { (snapshot) in
			guard snapshot.hasChildren() == true, let snaps = snapshot.children.allObjects as? [FIRDataSnapshot] else {
				completionHandler(.Failure())
				return
			}
			var products = [Product]()
			for snap in snaps {
				if let snapshotValue = snap.value as? [String: Any] {
					let product = Product(dict: snapshotValue)
					products.append(product)
				}
			}
			completionHandler(.Success(products))
		})
	}
}

extension Product: DictionaryConvertable {
	
	init(dict: [String: Any]) {
		let jsonDict = JSON(dict)
		self.name = ""
		self.description = ""
		if let name = jsonDict["name"].string {
			self.name = name
		}
		if let description = jsonDict["description"].string {
			self.description = description
		}
	}
	
	func convertToDict() -> [String: Any] {
		return [
			"name": name,
			"description": description
				]
	}
}
