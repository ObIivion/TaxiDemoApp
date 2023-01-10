//
//  URLImageView.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 07.01.2023.
//

import UIKit

class SizedImageView: UIImageView {
    
    override var image: UIImage? {
        didSet { updateAspectRatio() }
    }
    
    private var aspectRatioConstraint: NSLayoutConstraint?
    
    func updateAspectRatio() {
        if let aspectRatioConstraint = aspectRatioConstraint {
            removeConstraint(aspectRatioConstraint)
        }
        guard let image = image else { return }
        
        let aspectRatio = image.size.width / image.size.height
        let newConstraint = widthAnchor.constraint(equalTo: heightAnchor, multiplier: aspectRatio)
        newConstraint.priority = .defaultHigh
        
        aspectRatioConstraint = newConstraint
        NSLayoutConstraint.activate([newConstraint])
    }
}
