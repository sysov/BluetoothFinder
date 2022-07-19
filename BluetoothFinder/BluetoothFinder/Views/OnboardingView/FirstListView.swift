//
//  FirstListViewController.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 9.06.22.
//

import Foundation
import UIKit

final class FirstListView: UICollectionViewCell {
    
    // MARK: - FirstListView variables
    lazy var headingLabel = Label(style: .heading, "FIND YOUR")
    lazy var headingLabelMeter = Label(style: .heading, " LOST DEVICES")
    public static let identifier = "FirstView"
    lazy var backImage = UIImageView(image: R.image.onboardingBackgroundImage())
    lazy var backImage2 = UIImageView(image: R.image.firstOnboardingImage())
    
    // MARK: - FirstListView init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpFirstListView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - FirstListView SetUp views
    
   private func setUpFirstListView() {
        addSubview(backImage)
        addSubview(backImage2)
        addSubview(headingLabel)
        addSubview(headingLabelMeter)
       
       
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
            headingLabelMeter.topAnchor.constraint(equalTo: headingLabel.bottomAnchor,constant: 10),
            headingLabelMeter.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

