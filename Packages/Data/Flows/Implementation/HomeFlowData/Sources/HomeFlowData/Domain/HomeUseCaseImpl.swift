//
//  HomeUseCaseImpl.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import HomeFlowDataAPI

public class HomeUseCaseImpl: HomeUseCase {
    
    private let repository: HomeUseCaseRepository
    
    public init(repository: HomeUseCaseRepository) {
        self.repository = repository
    }
    
    public func provideModel() -> HomeUseCaseResponseModel {
        return HomeUseCaseResponseModel()
    }
}
