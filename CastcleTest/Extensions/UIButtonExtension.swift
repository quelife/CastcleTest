//
//  UIButtonExtension.swift
//  CastcleTest
//
//  Created by que on 17/12/2564 BE.
//

import UIKit

extension UIButton {
    func enableWithBGandTextColor(bgColor: UIColor, textColor: UIColor) {
        self.isEnabled = true
        self.setTitleColor(textColor, for: .normal)
        self.backgroundColor = bgColor
    }
    
    func disableWithBGandTextColor(bgColor: UIColor, textColor: UIColor) {
        self.isEnabled = false
        self.setTitleColor(textColor, for: .normal)
        self.backgroundColor = bgColor
    }
}
