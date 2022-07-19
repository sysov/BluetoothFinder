//
//  Device.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 13.07.22.
//

import Foundation


class Device {
  let locationManager = LocationManager()
  var repository = DeviceRepository()
  
  let id: UUID
  let name: String
  var givenName: String?
  var rssi: Int?
  var location: Location?
  var isTracking: Bool = false
  var lastScanned: Date?
  
  init(id: UUID, name: String, rssi: Int?, isTracking: Bool?, givenName: String?, location: Location?) {
    self.id = id
    self.name = name
    self.rssi = rssi
    self.givenName = givenName
    self.location = location
    if let isTracking = isTracking {
      self.isTracking = isTracking
    }
  }
  
 

  func startTracking(_ completion: @escaping (Error?) -> Void) {

    
    self.getLocation() { error in
      
      guard error == nil else {
        completion(error)
        return
          
          self.isTracking = true
          
          self.repository.create(a: self)
          
          completion(nil)
      }
    }
  }
  
  func stopTracking() {
    self.isTracking = false
  
  }
  
  private func getLocation(_ completion: @escaping (Error?) -> Void) {
    locationManager.getLocation { (location) in
      if let location = location {
        self.location = location
        completion(nil)
      } else {
        AlertManager.queue(alert: Alert(title: "Location Needed", message: "Please enable location services under Settings > Privacy so the app can help you locate your bluetooth devices."))
        completion(NSError(domain: "Could not get location.", code: 0, userInfo: nil))
      }
      
    }
  }
  
}

extension Device: Equatable {
  static func == (lhs: Device, rhs: Device) -> Bool {
    return lhs.id == rhs.id
  }
}




