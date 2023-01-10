//
//  DetailsView.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 07.01.2023.
//

import UIKit

class DetailsView: BaseView {
    
    private let startLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 1
        return label
    }()
    
    private let roundedLabelA: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let circleA: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return view
    }()
    
    private let roundedLabelB: UILabel = {
        let label = UILabel()
        label.text = "B"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let circleB: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return view
    }()
    
    private let addressSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return view
    }()
    
    private let endLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 1
        return label
    }()
    
    private let carImageView: SizedImageView = {
        let carImageView = SizedImageView()
        carImageView.clipsToBounds = true
        return carImageView
    }()
    
    private let carLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    private let regNumber: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let driverLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    override func layoutSubviews() {
        circleA.layer.cornerRadius = circleA.bounds.width/2
        circleB.layer.cornerRadius = circleB.bounds.width/2
    }
    
    override func setupView() {
        
        backgroundColor = .white
        
        addSubview(startLabel)
        addSubview(circleA)
        circleA.addSubview(roundedLabelA)
        
        addSubview(addressSeparatorView)
        
        addSubview(endLabel)
        addSubview(circleB)
        circleB.addSubview(roundedLabelB)
        
        addSubview(carImageView)
        addSubview(carLabel)
        addSubview(regNumber)
        addSubview(driverLabel)
        
        addSubview(priceLabel)
        
        setupConstraints()
    }
    
    func setData(model: ViewModel) {
        carLabel.text = String(format: Constants.strAuto, model.vehicle.modelName)
        regNumber.text = String(format: Constants.strRegNumber, model.vehicle.regNumber)
        driverLabel.text = String(format: Constants.strDriver, model.vehicle.driverName)
        startLabel.text = String.init(format: "%@ %@", model.startAddress.city, model.startAddress.address)
        endLabel.text = String.init(format: "%@ %@", model.endAddress.city, model.endAddress.address)
        priceLabel.text = String(format: Constants.strPrice, model.price.rubles, model.price.cops, model.price.currency)
    }
    
    func setImage(image: UIImage?) {
        carImageView.image = image
    }
    
    private func setupConstraints() {
        
        circleA.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleA.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            circleA.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            circleA.trailingAnchor.constraint(equalTo: startLabel.leadingAnchor, constant: -10),
            circleA.bottomAnchor.constraint(equalTo: addressSeparatorView.topAnchor, constant: -10),
            circleA.widthAnchor.constraint(equalToConstant: 19),
            circleA.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        roundedLabelA.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundedLabelA.centerXAnchor.constraint(equalTo: circleA.centerXAnchor),
            roundedLabelA.centerYAnchor.constraint(equalTo: circleA.centerYAnchor),
        ])
        
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            startLabel.leadingAnchor.constraint(equalTo: circleA.trailingAnchor, constant: 10),
            startLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            startLabel.bottomAnchor.constraint(equalTo: addressSeparatorView.topAnchor, constant: -10)
        ])

        addressSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressSeparatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            addressSeparatorView.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 10),
            addressSeparatorView.bottomAnchor.constraint(equalTo: endLabel.topAnchor, constant: -10),
            addressSeparatorView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            addressSeparatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        circleB.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleB.topAnchor.constraint(equalTo: addressSeparatorView.bottomAnchor, constant: 10),
            circleB.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            circleB.trailingAnchor.constraint(equalTo: endLabel.leadingAnchor, constant: -10),
            circleB.widthAnchor.constraint(equalToConstant: 19),
            circleB.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        roundedLabelB.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundedLabelB.centerXAnchor.constraint(equalTo: circleB.centerXAnchor),
            roundedLabelB.centerYAnchor.constraint(equalTo: circleB.centerYAnchor),
        ])

        endLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            endLabel.topAnchor.constraint(equalTo: addressSeparatorView.bottomAnchor, constant: 10),
            endLabel.leadingAnchor.constraint(equalTo: startLabel.leadingAnchor),
            endLabel.trailingAnchor.constraint(equalTo: startLabel.trailingAnchor)
        ])
        
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: endLabel.bottomAnchor, constant: 25),
            carImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            carImageView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        
        carLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carLabel.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 15),
            carLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            carLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        regNumber.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            regNumber.topAnchor.constraint(equalTo: carLabel.bottomAnchor, constant: 5),
            regNumber.leadingAnchor.constraint(equalTo: carLabel.leadingAnchor),
            regNumber.trailingAnchor.constraint(equalTo: carLabel.trailingAnchor)
        ])
        
        driverLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            driverLabel.topAnchor.constraint(equalTo: regNumber.bottomAnchor, constant: 10),
            driverLabel.leadingAnchor.constraint(equalTo: regNumber.leadingAnchor),
            driverLabel.trailingAnchor.constraint(equalTo: regNumber.trailingAnchor),
        ])
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            priceLabel.topAnchor.constraint(equalTo: driverLabel.bottomAnchor, constant: 35)
        ])
        
    }
}

extension DetailsView {
    
    struct ViewModel {
        let startAddress, endAddress: Address
        let price: DetailedPrice
        let vehicle: Vehicle
    }
    
    // MARK: - Price
    struct DetailedPrice {
        let rubles, cops: Int
        let currency: String
    }
}
