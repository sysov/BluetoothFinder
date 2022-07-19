//
//  SubscribeTwo.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 6.07.22.
//

import Foundation
import UIKit

final class SubscribeOne: View {
    
    lazy var headingLabel = Label(style: .heading, "UNLOCK")
    lazy var headingLabelMeter = Label(style: .heading, "ALL ACCESS")
    lazy var underLabel = Label(style: .subscribe, "Start with a 7 day trial, then 7.99$ per week")
    public static let identifier = "SubscribeView"
    lazy var backImage = UIImageView(image: R.image.onboardingBackgroundImage())
    lazy var backImage2 = UIImageView(image: R.image.subscribeImage())
    
    override func setup() {
        setUpSubscribeOneView()
    }
    
    private func setUpSubscribeOneView() {
        addSubview(backImage)
        addSubview(backImage2)
        addSubview(headingLabel)
        addSubview(headingLabelMeter)
        addSubview(underLabel)
        
        backImage.contentMode = .scaleAspectFit
        backImage2.contentMode = .center
        backImage.translatesAutoresizingMaskIntoConstraints = false
        backImage2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backImage.topAnchor.constraint(equalTo: self.topAnchor),
            backImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150),
            
            backImage2.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backImage2.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backImage2.topAnchor.constraint(equalTo: self.topAnchor),
            backImage2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -250),
            
            headingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headingLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 170),
            
            headingLabelMeter.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 10),
            headingLabelMeter.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            underLabel.topAnchor.constraint(equalTo: headingLabelMeter.bottomAnchor, constant: 40),
            underLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
}
