//
//  StarModel.swift
//  MVC-Practice
//
//  Created by 大西玲音 on 2021/09/15.
//

import Foundation

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
