//
//  TaskUseCase.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation

public struct TaskUseCaseResponseModel {
    
    public init() { }
}

public protocol TaskUseCase {
    func provideModel() -> TaskUseCaseResponseModel
}

public protocol TaskUseCaseRepository {
    func loadTask() -> TaskEntity
}
