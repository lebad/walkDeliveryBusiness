//
//  TableRepresentable.swift
//  walkdelivery
//
//  Created by AndreyLebedev on 22/10/2017.
//  Copyright © 2017 lebedac. All rights reserved.
//

import Foundation

protocol TableRepresentable: class {
	func numberOfRows() -> Int
	func viewModel(_ index: Int) -> ViewModelCellRepresentable
	func didSelectRow(_ index: Int)
}
