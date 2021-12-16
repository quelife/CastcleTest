//
//  UIViewExtension.swift
//  CastcleTest
//
//  Created by que on 16/12/2564 BE.
//

import Foundation
import UIKit

protocol Borderable {
    var cornerRadius: CGFloat { get set }
    var borderWidth: CGFloat { get set }
    var borderColor: UIColor? { get set }
}

@IBDesignable
extension UIView: Borderable {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            if newValue == 999 {
                layer.cornerRadius = self.frame.height / 2
                layer.masksToBounds = true
            }else{
                layer.cornerRadius = newValue
                layer.masksToBounds = true
            }
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else { return nil }
            return UIColor(cgColor: borderColor)
        }
        
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
