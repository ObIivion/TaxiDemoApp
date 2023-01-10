//
//  DetailsScreenBuilder.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 07.01.2023.
//

import Foundation

class DetailsScreen {
    
    let view: DetailsViewController
    let presenter: DetailsPresenter
    
    private init(view: DetailsViewController, presenter: DetailsPresenter) {
        self.view = view
        self.presenter = presenter
    }
    
    static func build(with model: OrdersModel) -> DetailsScreen {
        
        let presenter = DetailsPresenter(with: model)
        let view = DetailsViewController(presenter: presenter)
        presenter.view = view
        
        return DetailsScreen(view: view, presenter: presenter)
    }
    
}
