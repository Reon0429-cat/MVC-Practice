//
//  SubViewHandler.swift
//  MVC-Practice
//
//  Created by 大西玲音 on 2021/09/15.
//

import UIKit

final class SubViewHandler {
    
    private let starButton: UIButton
    private let model: StarModel
    
    init(handle starButton: UIButton,
         notify model: StarModel) {
        self.starButton = starButton
        self.model = model
        self.model.append(receiver: self)
        self.starButton.addTarget(self,
                                  action: #selector(SubViewHandler.starButtonDidTapped),
                                  for: .touchUpInside)
        
    }
    
    @objc
    private func starButtonDidTapped() {
        self.model.toggleStar()
    }
    
}

extension SubViewHandler: StarModelRecieverProtocol {
    
    func receive(isStar: Bool) {
        let title = isStar ? "★" : "☆"
        self.starButton.setTitle(title, for: .normal)
    }
    
}
