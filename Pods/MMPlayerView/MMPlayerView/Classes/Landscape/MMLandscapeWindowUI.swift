//
//  MMLandscapeWindowUI.swift
//  MMPlayerView
//
//  Created by Millman on 2020/2/4.
//

import Foundation
import SwiftUI
import Combine
@available(iOS 13.0.0, *)
public class MMLandscapeWindowUI: UIWindow {
    var originRect: CGRect = .zero
    public init() {
        super.init(frame: UIScreen.main.bounds)
        self.windowLevel = UIWindow.Level(rawValue: 1000)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func start<Content: View>(view: Content) {
        self.makeKeyAndVisible()
        self.rootViewController = UIHostingController(rootView: view)
        self.rootViewController?.view.backgroundColor = .clear
    }
    
    func stop() {
        self.isHidden = true
        self.rootViewController = nil
    }
}

@available(iOS 13.0.0, *)
public struct MMPlayerViewWindowUI: View {
    var duration: Double = 0.2
    @EnvironmentObject private var control: MMPlayerControl
    @State private var orientationCancel: AnyCancellable?
    let view: AnyView
    @Binding var fromRect: CGRect
    @State var animate = false
    public var body: some View {
        ZStack {
            Color.clear
            view.frame(width: animate ? UIScreen.main.bounds.height : self.fromRect.width,
                       height: animate ? UIScreen.main.bounds.width : self.fromRect.height)
                .rotationEffect(rotationValue)
                .animation(.easeInOut(duration: duration))
                .position(positionValue)
        }.onAppear(perform: {
            self.addOrientationObserverOnce()
        }).onDisappear(perform: {
            self.removeOrientationObserver()
        }).edgesIgnoringSafeArea(.all)
    }
    
    private func addOrientationObserverOnce() {
        self.orientationCancel = self.control.$orientation.sink { (status) in
            switch status {
            case .protrait:
                self.animate = false
                DispatchQueue.main.asyncAfter(deadline: .now() + self.duration + 0.1) {
                    self.control.landscapeWindow.stop()
                }
            case .landscapeLeft, .landscapeRight:
                self.animate = true
            }
        }
    }

    private func removeOrientationObserver() {
        self.orientationCancel?.cancel()
    }

    private var positionValue: CGPoint {
        let windowSize = UIScreen.main.bounds.size
        return animate ? CGPoint(x: windowSize.width/2, y: windowSize.height/2) : CGPoint(x: self.$fromRect.wrappedValue.midX, y: self.$fromRect.wrappedValue.midY)
    }
    
    private var rotationValue: Angle {
        switch control.orientation {
        case .protrait:
            return Angle(degrees: 0)
        case .landscapeRight:
            return Angle(degrees: animate ? -90 : 0)
        case .landscapeLeft:
            return Angle(degrees: animate ? 90 : 0)
        }
    }
    
    init<V: View>(view: V,rect: Binding<CGRect>) {
        self.view = AnyView.init(view)
        self._fromRect = rect
    }
}
