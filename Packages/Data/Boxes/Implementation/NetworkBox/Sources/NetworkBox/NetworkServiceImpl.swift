//
//  NetworkServiceImpl.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import NetworkBoxAPI

public class NetworkServiceImpl: NetworkService {
    
    public init() { }
    
    public func loadData(url: URL) async throws -> Data {
        fatalError("Test implmenetation")
    }
    
    public func executeRequest<V: Endpoint, T: Codable>(endpoint: V) async throws -> T {
        fatalError("Test implmenetation")
    }
}
