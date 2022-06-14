//
//  Label.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 3.06.22.
//

import Foundation
import UIKit

final class Label: UILabel {
    
    enum Labels {
        case tableSettingLabel
        case tableBluetoothLabel
        case heading
        case subscribe
    }
    
    init(style: Labels, _ text: String?) {
        super.init(frame: .zero)
        
        self.text     = text
        textColor     = R.color.settingTextColor()
        numberOfLines = 1
        textAlignment = .center
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch style {
        case .tableBluetoothLabel:
            font = R.font.gilroySemibold(size: 19)
            textAlignment = .left
        case .tableSettingLabel:
            font = R.font.gilroyMedium(size: 20)
            textAlignment = .left
        case .heading:
            font = R.font.gilroySemibold(size: 28)
            textAlignment = .center
        case .subscribe:
            font = R.font.gilroyRegular(size: 14)
            textAlignment = .center
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

