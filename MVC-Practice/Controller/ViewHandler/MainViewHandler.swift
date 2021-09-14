//
//  MainViewHandler.swift
//  MVC-Practice
//
//  Created by 大西玲音 on 2021/09/15.
//

import UIKit

final class MainViewHandler {
    
    private weak var navigator: UIViewController?
    private let navigateToSubViewButton: UIButton
    private let starButton: UIButton
    private let model: StarModel
    
    init(handle: (starButton: UIButton,
                  navigateToSubViewButton: UIButton),
         notify model: StarModel,
         navigatorBy navigator: UIViewController) {
        self.starButton = handle.starButton
        self.navigateToSubViewButton = handle.navigateToSubViewButton
        self.model = model
        self.navigator = navigator
        self.model.append(receiver: self)
        self.navigateToSubViewButton.addTarget(self,
                                               action: #selector(MainViewHandler.navigateToSubViewButtonDidTapped),
                                               for: .touchUpInside)
        self.starButton.addTarget(self,
                                  action: #selector(MainViewHandler.starButtonDidTapped),
                                  for: .touchUpInside)
    }
    
    @objc
    private func navigateToSubViewButtonDidTapped() {
        let subVC = SubViewController.instantiate(model: self.model)
        subVC.modalPresentationStyle = .fullScreen
        self.navigator?.present(subVC, animated: true)
    }
    
    @objc
    private func starButtonDidTapped() {
        self.model.toggleStar()
    }
    
}

extension MainViewHandler: StarModelRecieverProtocol {
    
    func receive(isStar: Bool) {
        let title = isStar ? "★" : "☆"
        self.starButton.setTitle(title, for: .normal)
    }
    
}
