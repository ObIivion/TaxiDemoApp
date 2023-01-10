//
//  BaseView.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 05.01.2023.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        awakeFromNib()
    }
    
    func setupView() {
        // need to override in subclasses
    }
}
