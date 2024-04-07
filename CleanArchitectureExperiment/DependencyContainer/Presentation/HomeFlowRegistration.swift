//
//  HomeFlowRegistration.swift
//  CleanArchitectureExperiment
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import CoreUI
import HomeFlow
import HomeFlowData
import TaskFlow
import SurveyFlow

extension DependencyContainer {
    
    typealias HomeFlowCoordinator = HomeCoordinator<TaskCoordinator, SurveyCoordinator, SurveyCoordinator>
    
    func provideHomeCoordinator(navigationContainer: NavigationContainer) -> HomeFlowCoordinator {
        let repository = HomeUseCaseRepositoryImpl(networkService: resolve())
        let useCase = HomeUseCaseImpl(repository: repository)
        let viewModel = HomeViewModel(useCase: useCase)
        
        let coordinator = HomeCoordinator(navigationContainer: navigationContainer, viewModel: viewModel) {
            self.provideTaskCoordinator()
        } onboardingCoordinator: { onDismiss in
            self.provideSurveyCoordinator(onDismiss: onDismiss)
        } surveyCoordinator: { onDismiss in
            self.provideSurveyCoordinator(onDismiss: onDismiss)
        }
        viewModel.delegate = coordinator
        
        return coordinator
    }
}
