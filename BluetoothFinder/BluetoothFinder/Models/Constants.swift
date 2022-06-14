//
//  Constants.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 9.06.22.
//

import Foundation
import UIKit


public class Constants {
    
    public static let shared = Constants()
    
    public var isRecordingAtLaunchEnabled: Bool {
        get {
            UserDefaults.standard.bool(forKey: #function)
        } set {
            UserDefaults.standard.setValue(newValue, forKey: #function)
        }
    }
    
    public var isFirstLaunch: Bool {
        get {
            UserDefaults.standard.bool(forKey: #function)
        } set {
            UserDefaults.standard.setValue(newValue, forKey: #function)
        }
    }
    
    public var isBig: Bool {
        if screenSize.height > 667 {
            return true
        } else {
            return false
        }
    }
    
    public var screenSize: CGSize {
        return UIScreen.main.bounds.size
    }
    
}

