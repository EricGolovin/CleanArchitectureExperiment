//
//  TaskFlowRegistration.swift
//  CleanArchitectureExperiment
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import TaskFlow
import TaskFlowData

extension DependencyContainer {
    
    func provideTaskCoordinator() -> TaskCoordinator {
        let repository = TaskUseCaseRepositoryImpl(databaseService: resolve())
        let useCase = TaskUseCaseImpl(repository: repository)
        let viewModel = TaskViewModel(useCase: useCase)
        return TaskCoordinator(viewModel: viewModel)
    }
}
