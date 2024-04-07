//
//  NetworkBoxRegistration.swift
//  CleanArchitectureExperiment
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import NetworkBoxAPI
import NetworkBox

extension DependencyContainer {
    
    func registerNetworkBox() {
        register(scope: .container) { resolver -> NetworkService in
            return NetworkServiceImpl()
        }
    }
}
