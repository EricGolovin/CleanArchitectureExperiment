//
//  SurveyFlowRegistration.swift
//  CleanArchitectureExperiment
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import SurveyFlow
import SurveyFlowData

extension DependencyContainer {
    
    func provideSurveyCoordinator(onDismiss: @escaping () -> Void) -> SurveyCoordinator {
        let repository = SurveyUseCaseRepositoryImpl()
        let useCase = SurveyUseCaseImpl(repository: repository)
        let viewModel = SurveyViewModel(useCase: useCase)
        let coordinator = SurveyCoordinator(viewModel: viewModel, onDismiss: onDismiss)
        viewModel.delegate = coordinator
        
        return coordinator
    }
}
