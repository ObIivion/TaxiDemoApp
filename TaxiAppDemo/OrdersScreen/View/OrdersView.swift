//
//  OrdersView.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 06.01.2023.
//

import UIKit

class OrdersView: BaseView {
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        return indicator
    }()
    
    let ordersTableView = UITableView()

    override func setupView() {
        backgroundColor = .white
        
        setViewState(state: .loading)
        
        addSubview(activityIndicator)
        addSubview(ordersTableView)
        setupConstranits()
    }
    
    func setViewState(state: ViewState) {
        switch state {
        case .loading:
            activityIndicator.startAnimating()
            ordersTableView.isHidden = true
        case .ready:
            activityIndicator.stopAnimating()
            ordersTableView.isHidden = false
        }
    }
    
    private func setupConstranits() {
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        ordersTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ordersTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            ordersTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            ordersTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            ordersTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }

}

extension OrdersView {
    enum ViewState {
        case loading
        case ready
    }
}
