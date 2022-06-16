//
//  MapViewController.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 15.06.22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    let mapView : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        map.layer.cornerRadius = 10
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setMapConstraints()
        mapView.delegate = self
        
//        view.backgroundColor = R.color.backgroundColorBluetooth()
    }
    

    private func setMapConstraints() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 76).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
    }
    

}

extension MapViewController : MKMapViewDelegate {

}

