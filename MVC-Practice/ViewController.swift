//
//  ViewController.swift
//  MVC-Practice
//
//  Created by 大西玲音 on 2021/09/15.
//

import UIKit

@objc protocol StarModelRecieverProtocol {
    func receive(isStar: Bool)
}

// Observable
final class StarModel {
    // 状態
    private var isStar: Bool
    private var receivers = NSHashTable<StarModelRecieverProtocol>.weakObjects()
    
    init(isStar: Bool) {
        self.isStar = isStar
    }
    
    // Viewからの指示で状態を変更
    func toggleStar() {
        self.isStar.toggle()
        notify()
    }
    // 結果をViewへ通知
    func append(receiver: StarModelRecieverProtocol) {
        self.receivers.add(receiver)
        receiver.receive(isStar: self.isStar)
    }
    
    private func notify() {
        self.receivers.allObjects.forEach { receiver in
            receiver.receive(isStar: self.isStar)
        }
    }
    
}

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

