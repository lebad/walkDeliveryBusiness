//
//  FireBaseReferenceAccecable.swift
//  walkdelivery
//
//  Created by andrey on 11/08/2017.
//  Copyright © 2017 lebedac. All rights reserved.
//

import Foundation
import Firebase

protocol FireBaseReferenceAccecable {
	var fireBaseReferenceUser: DatabaseReference? { get }
	var fireBaseReferenceBusiness: DatabaseReference? { get }
}

//extension FireBaseReferenceAccecable {
//	
//	var fireBaseReferenceUser: DatabaseReference? {
//		get {
//			guard let app = FirebaseApp(named: "User")
//				else { assert(false, "Cuuld not retrieve User app") }
//			let dataBase = Database.database(app: app)
//			let reference = dataBase.reference()
//			return reference
//		}
//	}
//	
//	var fireBaseReferenceBusiness: DatabaseReference? {
//		get {
//			guard let app = FIRApp(named: "Business")
//				else { assert(false, "Cuuld not retrieve User app") }
//			let dataBase = FIRDatabase.database(app: app)
//			let reference = dataBase.reference()
//			return reference
//		}
//	}
//}

