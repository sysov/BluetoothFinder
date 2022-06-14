//
//  BluetoothTableViewCell.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 3.06.22.
//

import UIKit


final class BluetoothTableViewCell: UITableViewCell {
    
    // MARK: - BluetoothTableViewCell variables
    
    private var iconBLE:   ImageView?
    private var labelDeviceBLE:  Label?
    let labelStatusBLE = UILabel()
    let iconDistance = UIImageView()
    let view = UIView()
    
    // MARK: - BluetoothTableViewCell init UIelement
    
    init(reuseIdentifier: String, icon: ImageView, label: Label) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        iconBLE = icon
        iconBLE?.contentMode = .center
        labelDeviceBLE = label
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        labelStatusBLE.text = "Offline"
        labelStatusBLE.font = R.font.gilroyRegular(size: 14)
        iconDistance.image = R.image.distanceBacground()
        
        guard let iconBLE = iconBLE else { return }
        guard let labelDeviceBLE = labelDeviceBLE else { return }
        
        iconBLE.contentMode = .center
        iconDistance.contentMode = .center
        
        iconDistance.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        addSubview(view)
        addSubview(iconBLE)
        addSubview(iconDistance)
        addSubview(labelDeviceBLE)
        addSubview(labelStatusBLE)
        
        iconBLE.backgroundColor = .blue
        iconDistance.backgroundColor = .blue
        
        // MARK: - BluetoothTableViewCell setUp constrains
        self.iconBLE?.translatesAutoresizingMaskIntoConstraints  = false
        self.labelDeviceBLE?.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        labelStatusBLE.translatesAutoresizingMaskIntoConstraints = false
        iconDistance.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            self.iconBLE!.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.79),
            self.iconBLE!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            self.iconBLE!.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            self.iconBLE!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            self.iconDistance.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            self.iconDistance.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            self.iconDistance.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            self.iconDistance.widthAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.79),
            
            self.labelDeviceBLE!.leadingAnchor.constraint(equalTo: self.iconBLE!.trailingAnchor, constant: 21),
            self.labelDeviceBLE!.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            self.labelDeviceBLE!.trailingAnchor.constraint(equalTo: iconDistance.leadingAnchor, constant: -21),
            
            self.labelStatusBLE.topAnchor.constraint(equalTo: self.labelDeviceBLE!.bottomAnchor, constant: 20),
            self.labelStatusBLE.leadingAnchor.constraint(equalTo: self.iconBLE!.trailingAnchor, constant: 21),
            self.labelStatusBLE.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

