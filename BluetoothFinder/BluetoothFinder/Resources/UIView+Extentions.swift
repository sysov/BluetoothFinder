//
//  UIView+Extentions.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 1.06.22.
//

import UIKit

extension UIView {
    func makeCenter(subview: UIView) {
        subview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        subview.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        subview.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        subview.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
}
