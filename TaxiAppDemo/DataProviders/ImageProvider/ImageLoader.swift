//
//  ImageLoader.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 08.01.2023.
//

import Foundation
import UIKit

class ImageLoader {
    
    private let imageCache: SyncImageCache = ImageCacheManager.shared
    private let imageProvider: AsyncImageProvider = DataTaskImageProvider.shared
    
    func getImageByURL(url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        let key = "\(url.hashValue)"
        
            if let cachedImage = self.imageCache.getImageFromCache(key: key) {
                print("is from cache")
                completion(.success(cachedImage))
                return
            }
        
        imageProvider.loadImage(url) { [weak self] result in
            switch result {
            case let .success(image):
                DispatchQueue.main.async {
                    self?.imageCache.saveImageToCache(image: image, key: key)
                    completion(.success(image))
                }
                
            case let .failure(error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
