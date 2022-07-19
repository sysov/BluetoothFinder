//
//  Device_ManagedObjects+CoreDataProperties.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 19.07.22.
//
//

import Foundation
import CoreData


extension Device_ManagedObjects {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Device_ManagedObjects> {
        return NSFetchRequest<Device_ManagedObjects>(entityName: "Device")
    }

    @NSManaged public var givenName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isTracking: Bool
    @NSManaged public var lastScanned: Date?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var name: String?

}

extension Device_ManagedObjects : Identifiable {

}
