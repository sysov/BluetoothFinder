//
//  CoreDataManager.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 15.07.22.
//

import UIKit
import CoreData

class CoreDataManager {
  
  static var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "BluetoothFinder")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
      
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  static var backgroundContext: NSManagedObjectContext = {
    return CoreDataManager.persistentContainer.newBackgroundContext()
  }()
  
  init() {
 
    
  }
  
}
