//
//  DeviceScannerViewModel.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 13.07.22.
//

import Foundation

class DeviceScannerViewModel {
  let deviceManager = DeviceManager.shared
  var deviceScannerCellViewModels: Observable<[DeviceScannerCellViewModel]> = Observable<[DeviceScannerCellViewModel]>([])
  
  init() {
    registerModelObservers()
  }
  
  private func registerModelObservers() {
  
    self.deviceManager.scannedDevices.addObserver(self, options: [.initial, .new]) { devices, change in
      
      self.loadDeviceViewModels(devices: devices)
      
    }
    
  }
  
  private func loadDeviceViewModels(devices: [Device]) {
    
    var deviceViewModelsArr: [DeviceScannerCellViewModel] = []
      let unknownArr: [DeviceScannerCellViewModel] = []
    for device in devices {
      if device.name == "unknown" {
//        unknownArr.append(DeviceScannerCellViewModel(device: device))
        continue
      }
      deviceViewModelsArr.append(DeviceScannerCellViewModel(device: device))
    }
    deviceViewModelsArr.append(contentsOf: unknownArr)
    self.deviceScannerCellViewModels.value = deviceViewModelsArr
    
  }
  
  func startScan() {
    deviceManager.startScan()
  }
  
  func stopScan() {
    deviceManager.stopScan()
  }
  
  
  
}


