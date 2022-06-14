//
//  SubscribeOneView.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 9.06.22.
//

import Foundation
import UIKit

final class SubscribeOneView: UICollectionViewCell {
    
    // MARK: - SubscribeOneView variables
    
    lazy var headingLabel = Label(style: .heading, "UNLOCK")
    lazy var headingLabelMeter = Label(style: .heading, "ALL ACCESS")
    lazy var underLabel = Label(style: .subscribe, "Start with a 7 day trial, then 7.99$ per week")
    public static let identifier = "SubscribeOne"
    lazy var backImage = UIImageView(image: R.image.onboardingBackgroundImage())
    lazy var backImage2 = UIImageView(image: R.image.subscribeImage())
    
    // MARK: - SubscribeOneView init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubscribeOneView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - SubscribeOneView setUp Views
    
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

