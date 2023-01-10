//
//  OrdersTableViewCell.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 06.01.2023.
//

import UIKit

class OrdersTableViewCell: BaseTableViewCell {
    
    private let startLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 4
        return label
    }()
    
    private let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "right arrow")
        return imageView
    }()
    
    private let endLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 4
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()

    override func setupCell() {
        
        addSubview(startLabel)
        addSubview(arrowImage)
        addSubview(endLabel)
        addSubview(dateLabel)
        addSubview(priceLabel)
        setupConstranits()
    }
    
    func setModel(model: OrdersTableViewCell.OrderCellModel) {
        startLabel.text = model.startAddress.city + "\n" + model.startAddress.address
        endLabel.text = model.endAddress.city + "\n" + model.endAddress.address
        dateLabel.text = model.orderTime
        priceLabel.text = String(format: "%i.%.2i %@", model.price.rubles, model.price.cops, model.price.currency)
    }
    
    private func setupConstranits() {
        
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            startLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            startLabel.trailingAnchor.constraint(equalTo: arrowImage.leadingAnchor, constant: -20),
        ])

        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrowImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            arrowImage.centerYAnchor.constraint(equalTo: startLabel.centerYAnchor),
            arrowImage.widthAnchor.constraint(equalToConstant: 50)
        ])

        endLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            endLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            endLabel.leadingAnchor.constraint(equalTo: arrowImage.trailingAnchor, constant: 20),
            endLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 15),
            dateLabel.leadingAnchor.constraint(equalTo: startLabel.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: endLabel.bottomAnchor, constant: 30),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ])
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.trailingAnchor.constraint(equalTo: endLabel.trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor)
        ])
    }

}

// MARK: - OrderCellModel
extension OrdersTableViewCell {
    
    struct OrderCellModel {
        let id: Int
        let startAddress, endAddress: Address
        let price: DetailedPrice
        let orderTime: String
    }
    
    // MARK: - Price
    struct DetailedPrice {
        let rubles, cops: Int
        let currency: String
    }
}
