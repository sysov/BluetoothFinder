//
//  BluetoothScannerCellView.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 13.07.22.
//

import UIKit

class DeviceScannerCellView: UITableViewCell {
    
    static let identifier = "DeviceScannerCell"
    
    lazy var viewCell: UIView = {
        let viewCell = UIView()
        viewCell.translatesAutoresizingMaskIntoConstraints = false
        viewCell.backgroundColor = .white
        viewCell.layer.cornerRadius = 10
        return viewCell
    }()
    
    lazy var viewDistance: UIImageView = {
        let viewDistance = UIImageView()
        viewDistance.translatesAutoresizingMaskIntoConstraints = false
        viewDistance.contentMode = .scaleAspectFit
        viewDistance.image = R.image.distanceBacground()
        return viewDistance
    }()
    
    lazy var iconDevice: UIImageView = {
        let iconDevice = UIImageView()
        iconDevice.translatesAutoresizingMaskIntoConstraints = false
        iconDevice.contentMode = .scaleAspectFit
        return iconDevice
    }()
    
    let label_DeviceName: UILabel = {
        let label_DeviceName = UILabel()
        label_DeviceName.translatesAutoresizingMaskIntoConstraints = false
        label_DeviceName.font = R.font.gilroySemibold(size: 19)
        label_DeviceName.textColor = R.color.settingTextColor()
        label_DeviceName.textAlignment = .left
        return label_DeviceName
    }()
    
    lazy var label_RSSI: UILabel = {
        let label_RSSI = UILabel()
        label_RSSI.translatesAutoresizingMaskIntoConstraints = false
        label_RSSI.font = R.font.gilroyBold(size: 14)
        label_RSSI.textColor = R.color.distanceTextColor()
        label_RSSI.textAlignment = .center
        return label_RSSI
    }()

    lazy var label_Status: UILabel = {
        let label_Status = UILabel()
        label_Status.translatesAutoresizingMaskIntoConstraints = false
        label_Status.font = R.font.gilroyRegular(size: 14)
        label_Status.textColor = R.color.distanceTextColor()
        label_Status.textAlignment = .center
        return label_Status
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(viewCell)
        contentView.addSubview(viewDistance)
        contentView.addSubview(label_DeviceName)
        contentView.addSubview(label_RSSI)
        contentView.addSubview(iconDevice)
        contentView.addSubview(label_Status)
        backgroundColor = .clear
        label_Status.text = "Online"
        
        
        viewCell.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 7).isActive = true
        viewCell.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -7).isActive = true
        viewCell.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        viewCell.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        iconDevice.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 10).isActive = true
        iconDevice.centerYAnchor.constraint(equalTo: viewCell.centerYAnchor).isActive = true
        iconDevice.heightAnchor.constraint(equalToConstant: 50).isActive = true
        iconDevice.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        viewDistance.centerYAnchor.constraint(equalTo: viewCell.centerYAnchor).isActive = true
        viewDistance.heightAnchor.constraint(equalToConstant: 50).isActive = true
        viewDistance.widthAnchor.constraint(equalToConstant: 50).isActive = true
        viewDistance.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -10).isActive = true
        
        label_DeviceName.leadingAnchor.constraint(equalTo: iconDevice.trailingAnchor,constant: 20).isActive = true
        label_DeviceName.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 13).isActive = true
        label_DeviceName.trailingAnchor.constraint(equalTo: viewDistance.leadingAnchor, constant: -20).isActive = true
        
        label_Status.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -13).isActive = true
        label_Status.leadingAnchor.constraint(equalTo: iconDevice.trailingAnchor,constant: 20).isActive = true
        
        label_RSSI.centerYAnchor.constraint(equalTo: viewDistance.centerYAnchor).isActive = true
        label_RSSI.centerXAnchor.constraint(equalTo: viewDistance.centerXAnchor).isActive = true
    }
    
    var deviceViewModel: DeviceScannerCellViewModel! {
      didSet {
        label_DeviceName.text = deviceViewModel.name
        label_RSSI.text = "\(deviceViewModel.distanceString)"
          
      }
    
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


