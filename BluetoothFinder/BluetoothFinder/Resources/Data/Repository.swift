//
//  Repository.swift
//  BluetoothFinder
//
//  Created by Valera Sysov on 15.07.22.
//

import Foundation

protocol Repository {
  
  associatedtype T
  
  func getAll() -> [T]
  func get( identifier:Int ) -> T?
  func create( a:T ) -> Bool
  func update( a:T ) -> Bool
  func delete( a:T ) -> Bool
}
