//
//  DetailsViewController.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 8.06.22.
//

import UIKit


 class DetailsViewController: UIViewController {
    
    // MARK: - DetailsViewController variables
    let image = UIImageView()
     
     
     
    lazy var foundButton = Button(style: .found, "I find it!")
    lazy var locationButton = Button(style: .location, nil)
    lazy var soundButton = Button(style: .sound, nil)
     lazy var favButton = Button(style: .favorite, nil)
     
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
        view.addSubview(foundButton)
        view.addSubview(locationButton)
        view.addSubview(soundButton)
        view.addSubview(discriptionLabel)
        view.addSubview(labelRSII)
        view.addSubview(image)
        setUpDiscriptionLabel()
        setUpRSSILabel()
        setUpImage()
        setUpButtomFound()
        setUpLocationButton()
        setUpSoundButton()
        configureNavigationSetting()
        
        locationButton.addTarget(self, action: #selector(locationButtonSelector), for: .touchUpInside)
        favButton.addTarget(self, action: #selector(favTap), for: .touchUpInside)
        
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
        soundButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36).isActive = true
        soundButton.bottomAnchor.constraint(equalTo: foundButton.topAnchor, constant: -146).isActive = true
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
     
     private func configureNavigationSetting(){
         navigationItem.rightBarButtonItem = UIBarButtonItem(customView: favButton)

     }
    
}

extension DetailsViewController {
    
    @objc func locationButtonSelector() {
//           let vc = MapViewController()
//        navigationController?.present(vc, animated: true)
      }
    
    @objc func favTap() {
        favButton.isSelected = true
    }
}

