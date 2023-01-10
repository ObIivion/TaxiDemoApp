//
//  ImageFileManager.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 08.01.2023.
//

import Foundation
import UIKit

protocol SyncImageCache {
    func saveImageToCache(image: UIImage, key: String)
    func getImageFromCache(key: String) -> UIImage?
}

class ImageCacheManager: SyncImageCache {
    
    static var shared = ImageCacheManager()
    
    private let fileManager = FileManager.default
    private lazy var cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .localDomainMask)[0].appendingPathComponent("tmp")
    
    init() {
        try? fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
    }
    
    
    func saveImageToCache(image: UIImage, key: String) {
        let imageData = image.jpegData(compressionQuality: 1)
        let imageFilePath = cacheDirectory.appendingPathComponent(key).path
        
        if fileManager.fileExists(atPath: imageFilePath) {
            try? fileManager.removeItem(atPath: imageFilePath)
        }
        
        fileManager.createFile(
            atPath: cacheDirectory.path,
            contents: imageData,
            attributes: [FileAttributeKey.creationDate: Date()]
        )
    }
    
    func getImageFromCache(key: String) -> UIImage? {
        let imageFilePath = cacheDirectory.appendingPathComponent(key).path
        
        do {
            let fileAttrs = try fileManager.attributesOfItem(atPath: imageFilePath)
            guard let creationDate = fileAttrs[FileAttributeKey.creationDate] as? Date else { return nil }
            
            if !isCachingTimeLeft(savedDate: creationDate) {
                return UIImage(contentsOfFile: imageFilePath)
            } else {
                try fileManager.removeItem(atPath: imageFilePath)
                return nil
            }
        } catch {
            return nil
        }
    }
    
   private func isCachingTimeLeft(savedDate: Date) -> Bool {
        return (Date().timeIntervalSince(savedDate) >= 600) ? true : false
    }
}
