//
//  OrdersRouter.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 06.01.2023.
//

import Foundation
import UIKit

protocol OrdersRouterProtocol {
    func openDetailsScreen(with model: OrdersModel)
}

class OrdersRouter: OrdersRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func openDetailsScreen(with model: OrdersModel) {
        let detailsVC = DetailsScreen.build(with: model).view
        detailsVC.title = detailsVC.presenter.formatDateTime(date: model.formattedDate)
        viewController?.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
