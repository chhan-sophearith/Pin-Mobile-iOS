//
//  Extension.swift
//  Pin-Mobile-iOS
//
//  Created by Chhan Sophearith on 14/6/23.
//

import Foundation
import UIKit
import AVFoundation

extension UIView {
    func shake() {
        UIDevice.vibrate()
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPointMake(self.center.x - 5.0, self.center.y))
        animation.toValue = NSValue(cgPoint: CGPointMake(self.center.x + 5.0, self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}

extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
