//
//  Image.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 2.06.22.
//

import Foundation
import UIKit

final class ImageView: UIImageView {
    
    enum Image {
        case lock
        case faq
        case rate
        case support
        case privacy
        case terms
        case share
        case distance
        case airpods
        case bluetooth
        case airtag
        case headphones
        case ipad
        case iphone
        case notebook
        case pen
        case speaker
        case tv
        case whatch
    }
    
    init(image: Image) {
        super.init(frame: .zero)
        
        switch image {
        case .lock:
            self.image = R.image.unlock()
        case .faq:
            self.image = R.image.faq()
        case .rate:
            self.image = R.image.rate()
        case .support:
            self.image = R.image.mail()
        case .privacy:
            self.image = R.image.privacyTerms()
        case .terms:
            self.image = R.image.privacyTerms()
        case .share:
            self.image = R.image.share()
        case .distance:
            self.image = R.image.distance()
        case .airpods:
            self.image = R.image.airpods()
        case .bluetooth:
            self.image = R.image.bluetooth()
        case .airtag:
            self.image = R.image.airtag()
        case .headphones:
            self.image = R.image.headphones()
        case .ipad:
            self.image = R.image.ipad()
        case .iphone:
            self.image = R.image.iphone()
        case .notebook:
            self.image = R.image.notebook()
        case .pen:
            self.image = R.image.pen()
        case .speaker:
            self.image = R.image.speaker()
        case .tv:
            self.image = R.image.tv()
        case .whatch:
            self.image = R.image.watch()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
