//
//  DetailsViewController.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 07.01.2023.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    func updateViewModel(preparedModel: OrdersModel)
    func updateImageInModel(fetchedImage: UIImage?)
}

class DetailsViewController: BaseViewController<DetailsView> {
    
    let presenter: DetailsPresenterProtocol
    
    init(presenter: DetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getCellData()
        presenter.getImageFromUrlOrCache()
    }
    
}

extension DetailsViewController: DetailsViewProtocol {
    
    func updateViewModel(preparedModel: OrdersModel) {
        
        let model = DetailsView.ViewModel(startAddress: preparedModel.startAddress,
                                          endAddress: preparedModel.endAddress,
                                          price: DetailsView.DetailedPrice.init(rubles: preparedModel.price.amount / 100,
                                                                                cops: preparedModel.price.amount % 100,
                                                                                currency: preparedModel.price.currency),
                                          vehicle: preparedModel.vehicle)
        
        mainView.setData(model: model)
    }
    
    func updateImageInModel(fetchedImage: UIImage?) {
        
        guard let fetchedImage = fetchedImage else {
            mainView.setImage(image: nil)
            return
        }
        
        mainView.setImage(image: fetchedImage)
    }
}
