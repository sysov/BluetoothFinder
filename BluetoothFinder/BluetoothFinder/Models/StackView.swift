//
//  StackView.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 9.06.22.
//

import Foundation
import UIKit

public class StackView: UIStackView {
    
    enum StackViewAxis {
        case horizontal
        case vertical
    }
    
    init(axis: StackViewAxis) {
        super.init(frame: .zero)
        
        switch axis {
        case .horizontal:
            self.axis    = .horizontal
            distribution = .equalSpacing
        case .vertical:
            self.axis = .vertical
        }
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
