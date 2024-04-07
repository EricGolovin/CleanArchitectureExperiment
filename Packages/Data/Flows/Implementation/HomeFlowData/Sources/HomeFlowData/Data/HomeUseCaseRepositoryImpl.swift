//
//  HomeUseCaseRepositoryImpl.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import HomeFlowDataAPI
import NetworkBoxAPI

struct HomeEntityModelExample: HomeEntity {
    
}

public class HomeUseCaseRepositoryImpl: HomeUseCaseRepository {
    
    private let networkService: NetworkService
    
    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    public func loadHome() -> HomeEntity {
        return HomeEntityModelExample()
    }
}
