//
//  UIView+Extansions.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 16.05.22.
//

import UIKit

 // MARK: - Extension UIView adding cornerRadius
extension UIView{
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
