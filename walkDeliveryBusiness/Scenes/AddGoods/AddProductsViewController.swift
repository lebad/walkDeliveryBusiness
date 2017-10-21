//
//  AddProductsViewController.swift
//  walkDeliveryBusiness
//
//  Created by andrey on 08/10/2017.
//  Copyright © 2017 AndreyLebedev. All rights reserved.
//

import UIKit

class AddProductsViewController: UIViewController {
	
	var output: AddProductsViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
		
		let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction(_:)))
		self.navigationItem.rightBarButtonItem = barButtonItem
    }
	
	@objc private func addAction(_ sender: UIBarButtonItem) {
		let alert = UIAlertController(title: "Add product", message: nil, preferredStyle: .alert)
		let saveAction = UIAlertAction(title: "Save", style: .default) { action in
			guard let textFields = alert.textFields,
			let name = textFields[0].text,
			let description = textFields[1].text else {
				self.show("You should fill fields")
				return
			}
			let product = Product(name: name, description: description)
			self.output?.add(product)
		}
		alert.addAction(saveAction);
		alert.addTextField() { nameTextField in
			nameTextField.placeholder = "name"
		}
		alert.addTextField() { descriptionTextField in
			descriptionTextField.placeholder = "description"
		}
		present(alert, animated: true)
	}
}

extension AddProductsViewController: AddProductsViewInput {
	func show(_ products:[Product]) {
		
	}
}

extension AddProductsViewController: AlertShowable {
	func show(_ alert: String) {
		let alert = UIAlertController(title: nil, message: alert, preferredStyle: .alert)
		present(alert, animated: true)
	}
}
