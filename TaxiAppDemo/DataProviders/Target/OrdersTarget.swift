//
//  Target.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 06.01.2023.
//

import Foundation

enum OrdersTarget: ApiTarget {
    case ordersList
    
    var endPoint: String {
        switch self {
        case .ordersList:
            return Constants.ordersEndpoint
        }
    }
}
