//
//  DetailsPresenter.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 07.01.2023.
//

import Foundation

protocol DetailsPresenterProtocol {
    func getCellData()
    func getImageFromUrlOrCache()
    func formatDateTime(date: Date?) -> String
}

class DetailsPresenter: DetailsPresenterProtocol {
    
    let imageLoader = ImageLoader()
    weak var view: DetailsViewProtocol?
    let orderModel: OrdersModel
    
    init(with model: OrdersModel) {
        self.orderModel = model
    }
    
    func getImageFromUrlOrCache() {

        guard let imageUrl = orderModel.imageUrl else { return }
        
        imageLoader.getImageByURL(url: imageUrl) { [weak self] result in
            switch result {
            case let .success(image):
                self?.view?.updateImageInModel(fetchedImage: image)
            case .failure(_):
                self?.view?.updateImageInModel(fetchedImage: nil)
            }
        }
    }
    
    func getCellData() {
        view?.updateViewModel(preparedModel: orderModel)
    }
    
    func formatDateTime(date: Date?) -> String {
        
        guard let date = date else {
            return Constants.strGetDateFailure
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "dd MMM yyyy, hh:mm"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
