//
//  Button.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 9.06.22.
//

import Foundation
import UIKit

final class Button: UIButton {
    
    let radius: CGFloat = 100
    let size: CGFloat = 100
    var uuid: UUID? = nil
    
    enum ButtonStyle {
        case _continue
        case link
        case close
        case found
        case location
        case sound
    }
    
    public func setUUID(_ uuid: UUID) {
        self.uuid = uuid
    }
    
    init(style: ButtonStyle, _ text: String?) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        sizeToFit()
        
        switch style {
        case ._continue:
            setTitle(text, for: .normal)
            setTitleColor(.white, for: .normal)
            titleLabel?.font = R.font.gilroySemibold(size: 17)
            heightAnchor.constraint(equalToConstant: 60).isActive = true
            backgroundColor = R.color.buttonColor()
            layer.cornerRadius = 12
            layer.masksToBounds = true
        case .link:
            setTitle(text, for: .normal)
            setTitleColor(.blue, for: .normal)
            titleLabel?.font = R.font.gilroySemibold(size: 12)
            
        case .close:
            setImage(R.image.onboardingClose(), for: .normal)
            heightAnchor.constraint(equalToConstant: 25).isActive = true
            widthAnchor.constraint(equalToConstant: 25).isActive = true
            
        case .found:
            setTitle(text, for: .normal)
            setTitleColor(.white, for: .normal)
            titleLabel?.font = R.font.gilroySemibold(size: 17)
            heightAnchor.constraint(equalToConstant: 60).isActive = true
            backgroundColor = R.color.buttonColor()
            layer.cornerRadius = 12
            layer.masksToBounds = true
            
        case .location:
            setImage(R.image.mapButton(), for: .normal)
            heightAnchor.constraint(equalToConstant: 48).isActive = true
            widthAnchor.constraint(equalToConstant: 48).isActive = true
            
        case .sound:
            setImage(R.image.soundButotn(), for: .normal)
            heightAnchor.constraint(equalToConstant: 48).isActive = true
            widthAnchor.constraint(equalToConstant: 48).isActive = true
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

