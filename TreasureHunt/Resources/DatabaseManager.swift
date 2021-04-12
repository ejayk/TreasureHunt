//
//  DatabaseManager.swift
//  TreasureHunt
//
//  Created by Ben Jenkyn on 2021-04-11.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager{
    public static let shared = DatabaseManager()
    
    private let ref = Database.database().reference()
}
