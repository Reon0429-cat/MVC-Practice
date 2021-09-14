//
//  NavigationRequestModelState.swift
//  MVC-Practice
//
//  Created by 大西玲音 on 2021/09/15.
//

import Foundation

protocol NavigationRequestModelProtocol: AnyObject {
    var state: NavigationRequestModelState { get }
    func requestToNavigate()
    func append(receiver: NavigationRequestModelReceiver)
}

protocol NavigationRequestModelReceiver: AnyObject {
    func receive(requestState: NavigationRequestModelState)
}

// 遷移状態を持つModel
enum NavigationRequestModelState {
    case haveNeverRequest
    case notReady
    case ready
}
