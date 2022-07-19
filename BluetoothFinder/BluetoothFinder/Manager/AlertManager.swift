//
//  AlertManager.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 13.07.22.
//

import Foundation

struct Alert {
  let title: String
  let message: String
}

class AlertManager {
  static var alertQueue: Observable<[Alert]> = Observable<[Alert]>([])
  
  static func queue(alert: Alert) {
    
    alertQueue.value.removeAll()
    alertQueue.value.append(alert)
    
  }
}

