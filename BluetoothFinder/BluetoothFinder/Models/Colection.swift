//
//  Colection.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 9.06.22.
//

import Foundation
import UIKit

final class CollectionView: UICollectionView {
    
    let layout = UICollectionViewFlowLayout()
    
  
    
    init(delegate: UICollectionViewDelegateFlowLayout, dataSource: UICollectionViewDataSource) {
        super.init(frame: .zero, collectionViewLayout: layout)
        setupLayout()
        
        self.delegate   = delegate
        self.dataSource = dataSource
        
        backgroundColor = R.color.backgroundColorBluetooth()
        
        isPagingEnabled = true
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLayout() {
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
