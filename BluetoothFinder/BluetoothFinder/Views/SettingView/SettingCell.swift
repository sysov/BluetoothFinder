//
//  SettingCell.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 2.06.22.
//

import Foundation
import UIKit


class SettingCell: UITableViewCell {
    
    private var iconSetting:   ImageView?
    private var labelSetting:  Label?

    init(reuseIdentifier: String, icon: ImageView, label: Label) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        iconSetting = icon
        iconSetting?.contentMode = .center
        labelSetting = label
        accessoryType = .disclosureIndicator
        guard let iconSetting = iconSetting else { return }
        guard let labelSetting = labelSetting else { return }
        
        addSubview(iconSetting)
        addSubview(labelSetting)
        
        self.iconSetting?.translatesAutoresizingMaskIntoConstraints  = false
        self.labelSetting?.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            self.iconSetting!.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.iconSetting!.centerYAnchor.constraint(equalTo: centerYAnchor),

            self.iconSetting!.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            self.iconSetting!.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            self.labelSetting!.leadingAnchor.constraint(equalTo: self.iconSetting!.trailingAnchor, constant: 20),
            self.labelSetting!.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

