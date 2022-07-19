//
//  BluetoothOff.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 5.07.22.
//
import UIKit
import CoreBluetooth

final class BluetoothOff: View {
    
    private let label: UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelText: UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var continueButton = Button(style: ._continue, "Continue")
    
    
    override func setup() {
        backgroundColor = R.color.backgroundColorBluetooth()
        addSubview(continueButton)
        addSubview(label)
        setUpLabel()
        addSubview(labelText)
        setUpLabelText()
        setUpContinueButton()
        continueButton.addTarget(self, action: #selector(settingOpen), for: .touchUpInside)
    }
        
    @objc func settingOpen() {
        let url = URL(string: "App-Prefs:root=Bluetooth")
        let app = UIApplication.shared
        app.open(url!, options: [:], completionHandler: nil)
    }
    
    private func setUpLabel() {
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 76).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
       
        label.contentMode = .scaleAspectFit
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.lineHeightMultiple = 2
        let attributes = [
            NSAttributedString.Key.foregroundColor: R.color.settingTextColor(),
            NSAttributedString.Key.font: R.font.gilroySemibold(size: 32), .paragraphStyle: paragraphStyle
        ]
        label.attributedText = NSAttributedString(string: "Your  devices", attributes: attributes as [NSAttributedString.Key : Any])
    }
    
    private func setUpLabelText() {
        labelText.widthAnchor.constraint(equalToConstant: 288).isActive = true
        labelText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        labelText.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        labelText.contentMode = .scaleAspectFit
        labelText.numberOfLines = 2
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineHeightMultiple = 2
        let attributes = [
            NSAttributedString.Key.foregroundColor: R.color.settingButtonColor(),
            NSAttributedString.Key.font: R.font.gilroySemibold(size: 19), .paragraphStyle: paragraphStyle
        ]
        labelText.attributedText = NSAttributedString(string: "Give the app bluetooth access to continue", attributes: attributes as [NSAttributedString.Key : Any])
    }
    
    private func setUpContinueButton() {
        
        continueButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -26).isActive = true
        continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
       
    }
}


