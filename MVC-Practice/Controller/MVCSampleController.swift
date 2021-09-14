//
//  MVCSampleViewController.swift
//  MVC-Practice
//
//  Created by 大西玲音 on 2021/09/15.
//

import UIKit

// 役割
// ユーザー操作の受付
// アクションを定義
protocol MVCSampleControllerProtocol { }

final class MVCSampleController {
    
    private let starModel: DelayStarModelProtocol
    private let navigationModel: NavigationRequestModelProtocol
    private let view: MVCSamplePassiveViewProtocol
    
    init(reactTo handle: (starButton: UIButton,
                          navigationButton: UIButton),
         command models: (starModel: DelayStarModelProtocol,
                          navigationModel: NavigationRequestModelProtocol),
         update view: MVCSamplePassiveViewProtocol) {
        self.starModel = models.starModel
        self.navigationModel = models.navigationModel
        self.view = view
        
        handle.navigationButton.addTarget(self,
                                          action: #selector(navigationButtonDidTapped),
                                          for: .touchUpInside)
        handle.starButton.addTarget(self,
                                    action: #selector(starButtonDidTapped),
                                    for: .touchUpInside)
    }
    
    @objc
    private func navigationButtonDidTapped() {
        switch self.starModel.state {
            case .sleeping(current: .star):
                self.view.navigate()
            case .sleeping(current: .unstar), .processing:
                self.view.present(alert: self.createNavigateAlert())
        }
    }
    
    @objc
    private func starButtonDidTapped() {
        starModel.toggleStar()
    }
    
    private func createNavigateAlert() -> UIAlertController {
        
    }
    
}

extension MVCSampleController: MVCSampleControllerProtocol {
    
}
