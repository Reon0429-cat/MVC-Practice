//
//  DelayStarModelState.swift
//  MVC-Practice
//
//  Created by 大西玲音 on 2021/09/15.
//

import Foundation

protocol DelayStarModelProtocol: AnyObject {
    var state: DelayStarModelState { get }
    func toggleStar()
    func star()
    func append(receiver: DelayStarModelReceiver)
}

protocol DelayStarModelReceiver: AnyObject {
    func receive(starState: DelayStarModelState)
}

// Starの状態を持つModel
enum DelayStarModelState {
    case sleeping(current: StarMode)
    case processing(next: StarMode)
    
    enum StarMode {
        case star
        case unstar
    }
}

