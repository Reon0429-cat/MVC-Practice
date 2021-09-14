//
//  ViewController.swift
//  MVC-Practice
//
//  Created by 大西玲音 on 2021/09/15.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var starButton: UIButton!
    @IBOutlet private weak var navigateToSubViewButton: UIButton!
    
    private var viewHandler: MainViewHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewHandler = MainViewHandler(
            handle: (starButton: starButton,
                     navigateToSubViewButton: navigateToSubViewButton),
            notify: StarModel(isStar: false),
            navigatorBy: self
        )
        
    }


}

