//
//  FAQCellTableViewCell.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 6.07.22.
//

import UIKit

class FAQCellTableViewCell: UITableViewCell {
    
    static let indetifire = "FAQCell"
    private let labelTitle: UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelDiscription: UILabel =  {
        let label = UILabel()
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        labelTitle.text = "fdsfd"
        contentView.addSubview(labelTitle)
        
        labelDiscription.text = "fdsfdgkjdfkjgklfdkgmdfgio roietn inthnjr b tngro igtrio   ein ogr oe nrgijiore t ien tioo ioner iog in ioergni  ing oienro o niogreno in eriogn ion oger iono ger "
        contentView.addSubview(labelDiscription)
        
        labelTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16).isActive = true
        
        labelDiscription.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 16).isActive = true
        labelDiscription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        labelDiscription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
