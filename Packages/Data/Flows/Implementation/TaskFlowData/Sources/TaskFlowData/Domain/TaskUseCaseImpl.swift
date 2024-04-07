//
//  TaskUseCaseImpl.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import TaskFlowDataAPI

public class TaskUseCaseImpl: TaskUseCase {
    
    private let repository: TaskUseCaseRepository
    
    public init(repository: TaskUseCaseRepository) {
        self.repository = repository
    }
    
    public func provideModel() -> TaskUseCaseResponseModel {
        return TaskUseCaseResponseModel()
    }
}
