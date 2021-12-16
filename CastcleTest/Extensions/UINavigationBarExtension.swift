//
//  UINavigationBarExtension.swift
//  CastcleTest
//
//  Created by que on 16/12/2564 BE.
//

import UIKit

extension UINavigationBar {
    func defaultNavigationBar() {
        setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        shadowImage = UIImage()
        isTranslucent = false
    }
    
    func transparentNavigationBar() {
        setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        shadowImage = UIImage()
        isTranslucent = true
    }
}
