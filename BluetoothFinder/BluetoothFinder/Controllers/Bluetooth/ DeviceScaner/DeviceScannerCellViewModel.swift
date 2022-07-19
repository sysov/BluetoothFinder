//
//  DeviceScannerCellViewModel.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 13.07.22.
//

import Foundation

class DeviceScannerCellViewModel {
  let device: Device!
  let name: String
  var rssi: Int?
  var distance: Double? {
    guard let rssi = self.rssi else { return nil }
    return calculateDistance(rssi: rssi)
  }
  var distanceString: String {
    var string = "-"
    if let distance = self.distance {
      
        if distance.isLessThanOrEqualTo(0.3) {
        string = "0m"
      }
      if !distance.isLess(than: 0.3) && distance.isLess(than: 1.0) {
        string = "1m"
      }
      if !distance.isLess(than: 1.0) && distance.isLess(than: 2.0) {
        string = "2m"
      }
        if !distance.isLess(than: 2.0) && distance.isLess(than: 3.0) {
          string = "3m"
        }
        if !distance.isLess(than: 3.0) && distance.isLess(than: 4.0) {
          string = "4m"
        }
        if !distance.isLess(than: 4.0) && distance.isLess(than: 5.0) {
          string = "5m"
        }
        if !distance.isLess(than: 5.0) && distance.isLess(than: 6.0) {
          string = "6m"
        }
        if !distance.isLess(than: 7.0) && distance.isLess(than: 8.0) {
          string = "7m"
        }
        if !distance.isLess(than: 8.0) && distance.isLess(than: 9.0) {
          string = "8m"
        }
        if !distance.isLess(than: 9.0) && distance.isLess(than: 10.0) {
          string = "9m"
        }
        if !distance.isLess(than: 10.0) && distance.isLess(than: 20.0) {
          string = "10m"
        }
        if !distance.isLess(than: 20.0) && distance.isLess(than: 30.0) {
          string = "20m"
        }
        if !distance.isLess(than: 30.0) && distance.isLess(than: 40.0) {
          string = "30m"
        }
        if !distance.isLess(than: 40.0) && distance.isLess(than: 50.0) {
          string = "40m"
        }
        
      if !distance.isLess(than: 50.0) {
        string = "50m"
      }
     
    }
    return string
  }
  
  init(device: Device) {
    self.device = device
    self.name = device.name
    if let rssi = device.rssi {
      self.rssi = rssi
    }
  }
  
  }
  
  func calculateDistance(rssi: Int) -> Double {
      let txPower = -59
    
    if (rssi == 0) {
      return -1.0
    }
    
      let ratio = (Double(rssi) * 1.0) / Double(txPower)
    if (ratio < 1.0) {
      return pow(ratio, 10)
    } else {
        let disatance = (0.89976) * pow(ratio, 7.7095) + 0.111
      return disatance
    }
  }
  
