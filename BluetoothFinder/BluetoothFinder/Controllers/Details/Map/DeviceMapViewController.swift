//
//  DeviceMapViewController.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 19.07.22.
//

import UIKit
import MapKit


class DeviceMapViewController: UIViewController, MKMapViewDelegate {
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.overrideUserInterfaceStyle = .light
        map.showsUserLocation = true
        return map
    }()
  
  let deviceMapViewModel = DeviceMapViewModel()
  
  override func viewDidLoad() {
      view.addSubview(mapView)
      setUpMapView()
      mapView.delegate = self
    registerObservers()
    deviceMapViewModel.getCurrentLocation()
      mapDeviceLocations()
  }
  
    
    private func setUpMapView() {
        
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
  private func registerObservers() {
    deviceMapViewModel.currentLocation.addObserver(self) { location, change in
      
      self.centerMapOnLocation(location: CLLocation(latitude: location.latitude, longitude: location.longitude))
      
    }
    
    deviceMapViewModel.devices.addObserver(self, options: [.initial, .new]) { devices, change in
      self.mapDeviceLocations()
    }
    
  }

  let regionRadius: CLLocationDistance = 5
  private func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    mapView.setRegion(coordinateRegion, animated: true)
  }
  
  private func mapDeviceLocations() {
    
    self.mapView.removeAnnotations(mapView.annotations)
    
    for device in deviceMapViewModel.devices.value {
      guard let location = device.location else { continue }
      
      
      
      let annotation = MKPointAnnotation()
      annotation.title = device.name
      annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
      self.mapView.addAnnotation(annotation)
      
    }
    
  }
  
}

