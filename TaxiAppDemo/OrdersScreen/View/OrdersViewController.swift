//
//  ViewController.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 07.01.2023.
//

import UIKit

protocol OrdersViewProtocol: AnyObject {
    func updateViewModel(preparedModel: [OrdersModel]?)
}

class OrdersViewController: BaseViewController<OrdersView> {
    
    private let presenter: OrdersPresenterProtocol
    private var ordersViewModel: [OrdersTableViewCell.OrderCellModel] = []
    
    init(presenter: OrdersPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.ordersTableView.delegate = self
        mainView.ordersTableView.dataSource = self
        mainView.ordersTableView.register(OrdersTableViewCell.self, forCellReuseIdentifier: OrdersTableViewCell.identifier)
        presenter.fetchData()
    }   
}

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ordersViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(of: OrdersTableViewCell.self, for: indexPath)
        cell?.setModel(model: ordersViewModel[indexPath.row])
        return cell ?? .init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.cellPressed(with: ordersViewModel[indexPath.row].id)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension OrdersViewController: OrdersViewProtocol {
    
    func updateViewModel(preparedModel: [OrdersModel]?) {
        
        guard let preparedModel = preparedModel else { return }
        
        let viewModel = preparedModel.map {
            OrdersTableViewCell.OrderCellModel(id: $0.id,
                                               startAddress: $0.startAddress,
                                               endAddress: $0.endAddress,
                                               price: OrdersTableViewCell.DetailedPrice(rubles: $0.price.amount / 100,
                                                                                        cops: $0.price.amount % 100,
                                                                                        currency: $0.price.currency),
                                               orderTime: presenter.formatDate(date: $0.formattedDate)) }
        self.ordersViewModel = viewModel
        mainView.ordersTableView.reloadData()
        mainView.setViewState(state: .ready)
    }
}
