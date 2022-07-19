//
//  SubscribeTwo.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 6.07.22.
//

import Foundation
import UIKit

final class SubscribeTwo: View {
    
    
    lazy var headingLabel = Label(style: .heading, "UNLOCK")
    lazy var headingLabelMeter = Label(style: .heading, "ALL ACCESS")
    lazy var underLabel1 = Label(style: .subscribeTwo, "·Adding devices to favorites")
    lazy var underLabel2 = Label(style: .subscribeTwo, "·Play sound to find device")
    lazy var underLabel3 = Label(style: .subscribeTwo, "·Show map")
    lazy var underLabel4 = Label(style: .subscribeTwo, "·Unlimited scans")
    lazy var underLabel5 = Label(style: .subscribeTwo, "·Access to new features")
    public static let identifier = "SubscribeView"
    lazy var backImage = UIImageView(image: R.image.subscribeBackImageTwo())
    
    
    lazy var continueButton = Button(style: ._continue, "Continue")
  
    
    override func setup() {
        setUpSubscribeOneView()
    }
    
    private func setUpSubscribeOneView() {
        addSubview(backImage)
        addSubview(headingLabel)
        addSubview(headingLabelMeter)
        addSubview(underLabel1)
        addSubview(underLabel2)
        addSubview(underLabel3)
        addSubview(underLabel4)
        addSubview(underLabel5)
        addSubview(continueButton)

        
        backImage.contentMode = .center
      
        backImage.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            backImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backImage.topAnchor.constraint(equalTo: self.topAnchor, constant: -160),
            backImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -400),
            
            headingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headingLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -206),
            
            headingLabelMeter.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 10),
            headingLabelMeter.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            underLabel1.topAnchor.constraint(equalTo: headingLabelMeter.bottomAnchor, constant: 40),
            underLabel1.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            underLabel2.topAnchor.constraint(equalTo: underLabel1.bottomAnchor, constant: 10),
            underLabel2.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            underLabel3.topAnchor.constraint(equalTo: underLabel2.bottomAnchor, constant: 10),
            underLabel3.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            underLabel4.topAnchor.constraint(equalTo: underLabel3.bottomAnchor, constant: 10),
            underLabel4.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            underLabel5.topAnchor.constraint(equalTo: underLabel4.bottomAnchor, constant: 10),
            underLabel5.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            continueButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            continueButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -145),
            
        ])
    }
}
