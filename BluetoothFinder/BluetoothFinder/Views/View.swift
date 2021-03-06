//
//  View.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 1.06.22.
//

import UIKit

class View: UIView {
    
    convenience init() {
        self.init(frame: CGRect.zero)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() { }
}
