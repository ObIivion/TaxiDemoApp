//
//  OrdersPresenter.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 07.01.2023.
//

import Foundation
import UIKit

protocol OrdersPresenterProtocol {
    func fetchData()
    func sortByDate()
    func formatDate(date: Date?) -> String
    func cellPressed(with id: Int)
}

class OrdersPresenter: OrdersPresenterProtocol {
    
    var ordersModel: [OrdersModel] = []
    
    var router: OrdersRouterProtocol!
    weak var view: OrdersViewProtocol?
    
    let apiProvider = ApiProvider<OrdersTarget>()
    
    func fetchData() {
        apiProvider.getData(.ordersList, model: [OrdersModel].self) { result in
            switch result {
            case let .success(responceData):
                self.ordersModel = responceData
                self.sortByDate()
                self.view?.updateViewModel(preparedModel: self.ordersModel)
            case .failure(_):
                self.view?.updateViewModel(preparedModel: nil)
            }
        }
    }
    
    func cellPressed(with id: Int) {
        if let model = self.ordersModel.first(where: { $0.id == id }) {
            router.openDetailsScreen(with: model)
        }
    }
    
    func sortByDate() {
        ordersModel.sort {
            if let date1 = $0.formattedDate, let date2 = $1.formattedDate {
                return date1 > date2
            } else { return false }
        }
    }
    
    func formatDate(date: Date?) -> String {
        
        guard let date = date else {
            return Constants.strGetDateFailure
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "d MMM y"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
