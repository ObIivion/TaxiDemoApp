//
//  ApiTarget.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 06.01.2023.
//

import Foundation

protocol ApiTarget {
    var endPoint: String { get }
}

extension ApiTarget where Self: RawRepresentable, Self.RawValue == String {
    var endPoint: String { rawValue }
}
