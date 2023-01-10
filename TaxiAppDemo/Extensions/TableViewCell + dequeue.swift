//
//  TableViewCell.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 07.01.2023.
//

import Foundation
import UIKit

extension UITableViewCell {
    class var identifier: String { "\(Self.self)" }
}

extension UITableView {
    func dequeueCell<T: UITableViewCell>(of type: T.Type = T.self, for indexPath: IndexPath) -> T? {
        dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
    }
}
