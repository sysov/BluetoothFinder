//
//  HeaderSettingView.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 1.06.22.
//

import UIKit

final class HeaderSettingView: View {
    
    private let label: UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setup() {
        addSubview(label)
        setUpLabel()
    }
        
    private func setUpLabel() {
        self.makeCenter(subview: label)
        label.contentMode = .scaleAspectFit
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.lineHeightMultiple = 2
        let attributes = [
            NSAttributedString.Key.foregroundColor: R.color.settingTextColor(),
            NSAttributedString.Key.font: R.font.gilroySemibold(size: 32), .paragraphStyle: paragraphStyle
        ]
        label.attributedText = NSAttributedString(string: "Settings", attributes: attributes as [NSAttributedString.Key : Any])
    }
}

