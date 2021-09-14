//
//  SubViewController.swift
//  MVC-Practice
//
//  Created by 大西玲音 on 2021/09/15.
//

import UIKit

final class SubViewController: UIViewController {

    @IBOutlet private weak var starButton: UIButton!
    
    private var viewHandler: SubViewHandler?
    private var model: StarModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let model = self.model else { return }
        self.viewHandler = SubViewHandler(handle: starButton,
                                          notify: model)
        
    }
    
    static func instantiate(model: StarModel) -> SubViewController {
        let vc = UIStoryboard(name: "Sub", bundle: nil)
            .instantiateViewController(identifier: "SubViewController") as! SubViewController
        vc.model = model
        return vc
    }
    
}
