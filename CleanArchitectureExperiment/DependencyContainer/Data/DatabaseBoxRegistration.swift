//
//  DatabaseBoxRegistration.swift
//  CleanArchitectureExperiment
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import DatabaseBoxAPI
import DatabaseBox

extension DependencyContainer {
    
    func registerDatabaseBox() {
        register(scope: .container) { resolver -> DatabaseService in
            return DatabaseServiceImpl()
        }
    }
}
