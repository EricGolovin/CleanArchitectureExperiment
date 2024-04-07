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
public class HomeCoordinator<TaskView: View, OnboardingView: View, SurveyView: View>: HomeViewModel.Delegate {
    
    enum NavigationPath {
        case task
    }
    
    enum ModalSheetPath: Identifiable {
        case onboarding
        
        var id: Int { hashValue }
    }
    
    enum FullScreenSheetPath: Identifiable {
        case survey
        
        var id: Int { hashValue }
    }
    
    let navigationContainer: NavigationContainer
    var modalSheetContainer: SheetContainer<ModalSheetPath>
    var fullScreenSheetContainer: SheetContainer<FullScreenSheetPath>
    let viewModel: HomeViewModel
    
    private let taskView: () -> TaskView
    private let onboardingView: (@escaping () -> Void) -> OnboardingView
    private let surveyView: (@escaping () -> Void) -> SurveyView
    
    public init(
        navigationContainer: NavigationContainer,
        viewModel: HomeViewModel,
        taskView: @escaping () -> TaskView,
        onboardingView: @escaping (@escaping () -> Void) -> OnboardingView,
        surveyView: @escaping (@escaping () -> Void) -> SurveyView
    ) {
        self.navigationContainer = navigationContainer
        modalSheetContainer = SheetContainer(navigationContainer)
        fullScreenSheetContainer = SheetContainer(navigationContainer)
        self.viewModel = viewModel
        self.taskView = taskView
        self.onboardingView = onboardingView
        self.surveyView = surveyView
        
        print("⭐️ HomeCoordinator init")
    }
    
    @ViewBuilder
    func buildView(for path: NavigationPath) -> some View {
        switch path {
        case .task:
            taskView()
        }
    }
    
    @ViewBuilder
    func buildView(for path: ModalSheetPath) -> some View {
        switch path {
        case .onboarding:
            onboardingView { [weak self] in
                guard let self else { return }
                modalSheetContainer.path = nil
            }
        }
    }
    
    @ViewBuilder
    func buildView(for path: FullScreenSheetPath) -> some View {
        switch path {
        case .survey:
            surveyView { [weak self] in
                guard let self else { return }
                fullScreenSheetContainer.path = nil
            }
        }
    }

    // MARK: HomeViewModel.Delegate conformance
    
    public func homeViewModelDidTapTask() {
        navigationContainer.push(NavigationPath.task)
    }
    
    public func homeViewModelDidTapOnboading() {
        modalSheetContainer.path = .onboarding
    }
    
    public func homeViewModelDidTapSurvey() {
        fullScreenSheetContainer.path = .survey
    }
}
