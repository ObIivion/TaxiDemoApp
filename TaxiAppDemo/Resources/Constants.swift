//
//  Constants.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 05.01.2023.
//

import Foundation

enum Constants {
    
    static let baseUrl = URL(string: "https://www.roxiemobile.ru/careers/test/")!
    static let ordersEndpoint = "orders.json"
    static let imagesEndpoint = "images/"
    
    private static func localizeString(_ key: String) -> String {
        return NSLocalizedString(key, tableName: "Constants", bundle: Bundle.main, value: key, comment: "Some komment")
    }
    
    static let strOrders = localizeString("orders")
    static let strAuto = localizeString("auto") + "%@"
    static let strRegNumber = localizeString("regNumber") + "%@"
    static let strDriver = localizeString("driver") + "%@"
    static let strPrice = localizeString("priсe") + "%i.%.2i %@"
    static let strGetDateFailure = localizeString("get_date_failure")
}
