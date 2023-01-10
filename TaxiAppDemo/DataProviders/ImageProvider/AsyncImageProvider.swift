//
//  ImageProvider.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 08.01.2023.
//

import Foundation
import UIKit

protocol AsyncImageProvider {
    func loadImage(_ url: URL, completion: @escaping (Result<UIImage, Error>) -> Void)
}

class DataTaskImageProvider: AsyncImageProvider {
    
    enum LoadError: Error {
        case notImage
    }
    
    static let shared = DataTaskImageProvider()
    
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func loadImage(_ url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            if let data = data, let image = UIImage(data: data) {
                completion(.success(image))
            } else {
                completion(.failure(LoadError.notImage))
            }
        }.resume()
    }
}
