//
//  NetworkService.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation

public protocol NetworkService {
    func loadData(url: URL) async throws -> Data
    func executeRequest<V: Endpoint, T: Codable>(endpoint: V) async throws -> T
}
