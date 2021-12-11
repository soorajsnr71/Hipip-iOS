//
//  CoverViewProtocol.swift
//  Pods
//
//  Created by Millman YANG on 2017/6/20.
//
//

import Foundation
import AVFoundation
import SwiftUI
@objc public protocol MMPlayerBasePlayerProtocol: class {
    weak var playLayer: MMPlayerLayer? { set get }
    @objc optional func player(isMuted: Bool)
    
    @objc optional func timerObserver(time: CMTime)
    @objc optional func coverView(isShow: Bool)
    @objc optional func removeObserver()
    @objc optional func addObserver()
}

public protocol MMPlayerCoverViewProtocol: MMPlayerBasePlayerProtocol {
    func currentPlayer(status: PlayStatus)
}

public protocol MMProgressProtocol {
    func start()
    func stop()
}

public protocol MMPlayerLayerProtocol: class {
    func touchInVideoRect(contain: Bool)
}

public protocol ConverterProtocol {
    associatedtype Element
    func parseText(_ value: String)
    func search(duration: TimeInterval, completed: @escaping (([Element])->Void))
}


// SwiftUI
@available(iOS 13.0.0, *)
public protocol ProgressUIProtocol {
//    init(isStart: Binding<Bool>)
    associatedtype Content: View
    func start(isStart: Bool) -> Self.Content
}

@available(iOS 13.0.0, *)
public typealias ProgressContent = View
@available(iOS 13.0.0, *)
public typealias CoverProtocol = View


