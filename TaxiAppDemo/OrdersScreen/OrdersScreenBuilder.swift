//
//  OrderScreenBuilder.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 06.01.2023.
//

import Foundation
import UIKit

class OrdersScreen {
    
    let view: OrdersViewController
    let presenter: OrdersPresenter
    let router: OrdersRouter
    
    private init(view: OrdersViewController, presenter: OrdersPresenter, router: OrdersRouter) {
        self.view = view
        self.presenter = presenter
        self.router = router
    }
    
    static func build() -> OrdersScreen {
        
        let router = OrdersRouter()
        let presenter = OrdersPresenter()
        let view = OrdersViewController(presenter: presenter)
        presenter.router = router
        presenter.view = view
        router.viewController = view
        
        return OrdersScreen(view: view, presenter: presenter, router: router)
    }
}
