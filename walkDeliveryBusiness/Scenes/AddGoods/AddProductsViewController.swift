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
	var tableRepresentable: TableRepresentable?
	
	var tableView: UITableView = {
		let tableView = UITableView(frame: CGRect.zero, style: .plain)
		tableView.backgroundColor = UIColor.clear
		return tableView
	}()
	let ProductCellReuseIdentifier = "ProductCell"
	
	var activityIndicator: UIActivityIndicatorView = {
		let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
		activityIndicator.frame = CGRect.zero
		return activityIndicator
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
		
		let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction(_:)))
		self.navigationItem.rightBarButtonItem = barButtonItem
		setupTableView()
		setupActivityIndicator()
		
		output?.viewPrepared()
    }
	
	func setupTableView() {
		tableView.dataSource = self
		tableView.delegate = self
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.tableFooterView = UIView()
		self.view.addSubview(tableView)
		tableView.snp.makeConstraints { make in
			make.size.equalToSuperview()
		}
	}
	
	func setupActivityIndicator() {
		self.view.addSubview(activityIndicator)
		activityIndicator.snp.makeConstraints { make in
			make.center.equalToSuperview()
		}
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

extension AddProductsViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let tableRepresentable = tableRepresentable else { return 0 }
		return tableRepresentable.numberOfRows()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let tableRepresentable = self.tableRepresentable else { return UITableViewCell() }
		let viewModel = tableRepresentable.viewModel(indexPath.row) as! Product
		var cell = tableView.dequeueReusableCell(withIdentifier: ProductCellReuseIdentifier)
		if cell == nil {
			cell = UITableViewCell(style: .value1, reuseIdentifier: ProductCellReuseIdentifier)
		}
		cell?.textLabel?.text = viewModel.name
		cell?.detailTextLabel?.text = viewModel.description
		return cell!
	}
}

extension AddProductsViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
}

extension AddProductsViewController: AddProductsViewInput {
	func show(_ products:[Product]) {
		tableView.reloadData()
	}
}

extension AddProductsViewController: AlertShowable {
	func show(_ alert: String) {
		let alert = UIAlertController(title: nil, message: alert, preferredStyle: .alert)
		let action = UIAlertAction(title: "Ok", style: .default)
		alert.addAction(action)
		present(alert, animated: true)
	}
}

extension AddProductsViewController: TaskProgressShowable {
	func showStart() {
		activityIndicator.startAnimating()
	}
	func showFinish() {
		activityIndicator.stopAnimating()
	}
}

extension Product: ViewModelCellRepresentable {
	func cellType() -> UITableViewCell.Type {
		return UITableViewCell.self
	}
}
