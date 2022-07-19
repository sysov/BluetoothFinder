//
//  SubscribeOneView.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 9.06.22.
//

import Foundation
import UIKit

final class SubscribeView: UICollectionViewCell {
    
    let sub = SubscribeTwo()
    
    
    // MARK: - SubscribeOneView variables
    
    public static let identifier = "SubscribeView"

    // MARK: - SubscribeOneView init
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(sub)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - SubscribeOneView setUp Views
    
   func setupView() {
       sub.translatesAutoresizingMaskIntoConstraints = false
    
       NSLayoutConstraint.activate([
       sub.leadingAnchor.constraint(equalTo: self.leadingAnchor),
       sub.trailingAnchor.constraint(equalTo: self.trailingAnchor),
       sub.topAnchor.constraint(equalTo: self.topAnchor),
       sub.bottomAnchor.constraint(equalTo: self.bottomAnchor),
       ])
    }
}

