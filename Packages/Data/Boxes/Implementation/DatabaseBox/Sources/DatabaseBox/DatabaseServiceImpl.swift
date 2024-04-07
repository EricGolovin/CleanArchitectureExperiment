//
//  DatabaseServiceImpl.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import SwiftData
import DatabaseBoxAPI

public class DatabaseServiceImpl: DatabaseService {
    
    private lazy var container: ModelContainer? = {
        do {
            return try ModelContainer(for: TaskModel.self)
        } catch let error as NSError {
            assertionFailure("Error: \(error.debugDescription)")
            return nil
        }
    }()
    
    public init() { }
    
    public func fetch<T>(_ descriptor: FetchDescriptor<T>) throws -> [T] where T: PersistentModel {
        fatalError("Test implementation")
    }
    
    public func insert<T>(_ model: T) throws where T: PersistentModel {
        
    }
    
    public func delete<T>(model: T.Type) throws where T: PersistentModel {
        
    }
    
    public func delete<T>(model: T.Type, where predicate: Predicate<T>?) throws where T: PersistentModel {
        
    }
}
