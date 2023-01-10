//
//  BaseViewController.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 05.01.2023.
//

import UIKit

class BaseViewController<T: UIView>: UIViewController {
    
    var mainView: T { view as! T }
    
    override func loadView() {
        super.loadView()
        view = T()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        awakeFromNib()
    }
}
