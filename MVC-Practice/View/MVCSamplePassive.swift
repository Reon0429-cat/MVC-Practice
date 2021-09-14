//
//  MVCSamplePassive.swift
//  MVC-Practice
//
//  Created by 大西玲音 on 2021/09/15.
//

import UIKit

protocol MVCSamplePassiveViewProtocol: DelayStarModelReceiver,
                                       NavigationRequestModelReceiver {
    func navigate()
    func present(alert: UIAlertController)
}

// 役割
// アクションの結果/途中経過(Modelの状態)を受け取る
// 内部表現を視覚表現を変換する
final class MVCSamplePassive: UIView {
    
    private let starButton: UIButton
    private let navigationButton: UIButton
    
    init(starButton: UIButton,
         navigationButton: UIButton,
         observe models: (starModel: DelayStarModelProtocol,
                          navigationModel: NavigationRequestModelProtocol)) {
        self.starButton = starButton
        models.starModel.append(receiver: self.starModelReceiver)
        models.navigationModel.append(receiver: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MVCSamplePassive: MVCSamplePassiveViewProtocol {
    
    func navigate() {
        <#code#>
    }
    
    func present(alert: UIAlertController) {
        <#code#>
    }
    
}

extension MVCSamplePassive: DelayStarModelReceiver {
    
    func receive(starState: DelayStarModelState) {
        <#code#>
    }
    
}

extension MVCSamplePassive: NavigationRequestModelReceiver {
    
    func receive(requestState: NavigationRequestModelState) {
        <#code#>
    }
    
}
