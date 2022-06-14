//
//  DetailsViewController.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 8.06.22.
//

import UIKit
import CoreBluetooth


final class DetailsViewController: UIViewController {
    
    
    // MARK: - DetailsViewController variables
    var selectedPeripheral: CBPeripheral?
    var centralManagerTwo: CBCentralManager!
    let image = UIImageView()
    
    lazy var count = 0
    lazy var rssiSum = 0
    lazy var distance: Double = 0.0
    let mesuredPower = -69.0
    let nConstant = 4.0
    
    lazy var foundButton = Button(style: .found, "I find it!")
    lazy var locationButton = Button(style: .location, nil)
    lazy var soundButtom = Button(style: .sound, nil)
    
    private let discriptionLabel: UILabel =  {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 240, height: 54))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .center
        label.numberOfLines = 2
        label.textColor = R.color.detailsTextColor()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineHeightMultiple = 1.14
        let attributes = [
            NSAttributedString.Key.font: R.font.gilroySemibold(size: 19), .paragraphStyle: paragraphStyle
        ]
        label.attributedText = NSAttributedString(string: "Move around so that the signal level increases", attributes: attributes as [NSAttributedString.Key : Any])
        return label
    }()
    
    private let labelRSII: UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .center
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = ""
        label.font = R.font.gilroySemibold(size: 28)
        label.textColor = .white
        return label
    }()
    
    // MARK: - DetailsViewController viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(named: "circle")
        image.contentMode = .scaleAspectFill
        view.backgroundColor = R.color.backgroundColorBluetooth()
        view.addSubview(discriptionLabel)
        view.addSubview(image)
        view.addSubview(labelRSII)
        view.addSubview(foundButton)
        view.addSubview(locationButton)
        view.addSubview(soundButtom)
        setUpDiscriptionLabel()
        setUpRSSILabel()
        setUpImage()
        setUpButtomFound()
        setUpLocationButton()
        setUpSoundButton()
        
        centralManagerTwo = CBCentralManager(delegate: self, queue: nil)
        if let selectedPeripheral = selectedPeripheral {
            if selectedPeripheral.name != nil {
                discriptionLabel.text = selectedPeripheral.name
            }
            else {
                discriptionLabel.text = "No Name"
            }
        }
    }
    
    // MARK: - DetailsViewController setUpViews
    private func setUpButtomFound() {
        foundButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        foundButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        foundButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34).isActive = true
    }
    
    private  func setUpLocationButton() {
        locationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36).isActive = true
        locationButton.bottomAnchor.constraint(equalTo: foundButton.topAnchor, constant: -146).isActive = true
    }
    private  func setUpSoundButton() {
        soundButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36).isActive = true
        soundButtom.bottomAnchor.constraint(equalTo: foundButton.topAnchor, constant: -146).isActive = true
    }
    
    private  func setUpDiscriptionLabel() {
        discriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 95).isActive = true
        discriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75).isActive = true
        discriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75).isActive = true
    }
    private func setUpRSSILabel() {
        labelRSII.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelRSII.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setUpImage() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36).isActive = true
        image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36).isActive = true
        image.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: -36).isActive = true
        image.bottomAnchor.constraint(equalTo: locationButton.topAnchor, constant: 4).isActive = true
    }
    
}

// MARK: - DetailsViewController CBCCentralManager
extension DetailsViewController: CBCentralManagerDelegate, CBPeripheralDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("central.state is .unknown")
        case .resetting:
            print("central.state is .resetting")
        case .unsupported:
            print("central.state is .unsupported")
        case .unauthorized:
            print("central.state is .unauthorized")
        case .poweredOff:
            print("central.state is .poweredOff")
        case .poweredOn:
            print("central.state is .poweredOn")
            centralManagerTwo.scanForPeripherals(withServices: nil)
        @unknown default:
            print("we screwed")
        }
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if labelRSII.text! == "" {
            labelRSII.text = "Searching..."
        }
        if peripheral.identifier != selectedPeripheral?.identifier {
            //            rssiSum += Int(Double(truncating: RSSI))
            //            count += 1
            //            if count == 10 {
            //                rssiTextUpdate(rssi: NSNumber(value: rssiSum/11))
            //                count = 0
            //                rssiSum = 0
            distance = pow(10.0, (((mesuredPower - Double(truncating: RSSI))) / (10 * nConstant)))
            count += 1
            if count == 10 {
                rssiTextUpdate(rssi: NSNumber(value: distance/10))
                count = 0
                distance = 0
            }
        }
        restartScan()
    }
    func rssiTextUpdate(rssi: NSNumber) {
        switch Int(truncating: rssi) {
        case 0 ... 100:
            labelRSII.text = "\(distance)"
            //        case 1 ... 3:
            //            labelRSII.text = "75%"
            //        case 3 ... 5:
            //            labelRSII.text = "50%"
            //        case 5 ...  7:
            //            labelRSII.text = "25%"
            //        case 7...10:
            //            labelRSII.text = "0"
            
        default:
            print("0")
            //            labelRSII.text = "Searching"
        }
    }
    func restartScan() {
        centralManagerTwo.stopScan()
        centralManagerTwo.scanForPeripherals(withServices: nil)
    }
    func centralManager(central: CBCentralManager!, didConnectPeripheral
                        peripheral: CBPeripheral!) {
    }
}
