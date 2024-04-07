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
    
    func provideHomeCoordinator(navigationContainer: NavigationContainer) -> HomeCoordinator<TaskCoordinatorView, SurveyCoordinatorView, SurveyCoordinatorView> {
        let repository = HomeUseCaseRepositoryImpl(networkService: resolve())
        let useCase = HomeUseCaseImpl(repository: repository)
        let viewModel = HomeViewModel(useCase: useCase)
        
        let coordinator = HomeCoordinator(navigationContainer: navigationContainer, viewModel: viewModel) {
            let coordinator = self.provideTaskCoordinator()
            return TaskCoordinatorView(coordinator: coordinator)
        } onboardingView: { onDismiss in
            let coordinator = self.provideSurveyCoordinator(onDismiss: onDismiss)
            return SurveyCoordinatorView(coordinator: coordinator)
        } surveyView: { onDismiss in
            let coordinator = self.provideSurveyCoordinator(onDismiss: onDismiss)
            return SurveyCoordinatorView(coordinator: coordinator)
        }
        viewModel.delegate = coordinator
        
        return coordinator
    }
}
