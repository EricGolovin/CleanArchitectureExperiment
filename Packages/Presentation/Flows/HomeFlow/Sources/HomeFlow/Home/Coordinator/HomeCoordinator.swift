//
//  HomeCoordinator.swift
//  
//
//  Created by Erik Golovin on 02/04/2024.
//

import Observation
import SwiftUI
import CoreUI

@Observable
public class HomeCoordinator<TaskCoordinator: Coordinator, OnboardingCoordinator: Coordinator, SurveyCoordinator: Coordinator>: HomeViewModel.Delegate {
    
    enum NavigationPath: Hashable {
        case task(TaskCoordinator)
    }
    
    enum ModalSheetPath: Hashable {
        case onboarding(OnboardingCoordinator)
    }
    
    enum FullScreenSheetPath: Hashable {
        case survey(SurveyCoordinator)
    }
    
    let navigationContainer: NavigationContainer
    var modalSheetContainer: SheetContainer<ModalSheetPath>
    var fullScreenSheetContainer: SheetContainer<FullScreenSheetPath>
    let viewModel: HomeViewModel

    private let taskCoordinator: () -> TaskCoordinator
    private let onboardingCoordinator: (@escaping () -> Void) -> OnboardingCoordinator
    private let surveyCoordinator: (@escaping () -> Void) -> SurveyCoordinator
    
    public init(
        navigationContainer: NavigationContainer,
        viewModel: HomeViewModel,
        taskCoordinator: @escaping () -> TaskCoordinator,
        onboardingCoordinator: @escaping (@escaping () -> Void) -> OnboardingCoordinator,
        surveyCoordinator: @escaping (@escaping () -> Void) -> SurveyCoordinator
    ) {
        self.navigationContainer = navigationContainer
        modalSheetContainer = SheetContainer(navigationContainer)
        fullScreenSheetContainer = SheetContainer(navigationContainer)
        self.viewModel = viewModel
        self.taskCoordinator = taskCoordinator
        self.onboardingCoordinator = onboardingCoordinator
        self.surveyCoordinator = surveyCoordinator
    }

    // MARK: HomeViewModel.Delegate conformance
    
    public func homeViewModelDidTapTask() {
        navigationContainer.push(NavigationPath.task(taskCoordinator()))
    }
    
    public func homeViewModelDidTapOnboarding() {
        let coordinator = onboardingCoordinator { [weak self] in
            guard let self else { return }
            modalSheetContainer.path = nil
        }
        modalSheetContainer.setPath(.onboarding(coordinator))
    }
    
    public func homeViewModelDidTapSurvey() {
        let coordinator = surveyCoordinator { [weak self] in
            guard let self else { return }
            fullScreenSheetContainer.path = nil
        }
        fullScreenSheetContainer.setPath(.survey(coordinator))
    }
}
