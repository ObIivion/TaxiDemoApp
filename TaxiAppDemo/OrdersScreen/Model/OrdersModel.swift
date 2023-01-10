//
//  OrdersModel.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 05.01.2023.
//

import Foundation

// MARK: - OrdersModelElement
struct OrdersModel: Codable {
    let id: Int
    let startAddress, endAddress: Address
    let price: Price
    let orderTime: String
    let vehicle: Vehicle
    
    var formattedDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let formattedDate = dateFormatter.date(from: orderTime)
        return formattedDate
    }
    
    var imageUrl: URL? { Constants.baseUrl.appendingPathComponent(Constants.imagesEndpoint + vehicle.photo) }
}

// MARK: - Address
struct Address: Codable {
    let city, address: String
}

// MARK: - Price
struct Price: Codable {
    let amount: Int
    let currency: String
}

// MARK: - Vehicle
struct Vehicle: Codable {
    let regNumber, modelName, photo, driverName: String
}
