//
//  HomeUseCase.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation

public struct HomeUseCaseResponseModel {
    
    public init() { }
}

public protocol HomeUseCase {
    func provideModel() -> HomeUseCaseResponseModel
}

public protocol HomeUseCaseRepository {
    func loadHome() -> HomeEntity
}
