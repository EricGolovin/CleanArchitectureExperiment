//
//  DatabaseService.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import SwiftData

public protocol DatabaseService {
    func fetch<T>(_ descriptor: FetchDescriptor<T>) throws -> [T] where T: PersistentModel
    func insert<T>(_ model: T) throws where T: PersistentModel
    func delete<T>(model: T.Type) throws where T: PersistentModel
    func delete<T>(model: T.Type, where predicate: Predicate<T>?) throws where T: PersistentModel
}
