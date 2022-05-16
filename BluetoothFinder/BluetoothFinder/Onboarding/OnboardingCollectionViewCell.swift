//
//  OnboardingCollectionViewCell.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 16.05.22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let indentifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideImageBackground: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    
    
    func setUpSlideContent (_ slide: OnboardingSlide){
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
    }
    
}
