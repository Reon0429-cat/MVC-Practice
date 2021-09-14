//
//  MVCSampleViewController.swift
//  MVC-Practice
//
//  Created by 大西玲音 on 2021/09/15.
//

import UIKit

final class MVCSampleViewController: UIViewController {
    
    private let starModel: DelayStarModelProtocol
    private var controller: MVCSampleControllerProtocol?
    
    init(starModel: DelayStarModelProtocol) {
        self.starModel = starModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
