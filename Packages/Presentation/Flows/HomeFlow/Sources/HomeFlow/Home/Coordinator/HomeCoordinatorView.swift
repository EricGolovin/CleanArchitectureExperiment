//
//  HomeCoordinatorView.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import SwiftUI
import CoreUI

public struct HomeCoordinatorView<TaskCoordinator: Coordinator, OnboardingCoordinator: Coordinator, SurveyCoordinator: Coordinator>: View {
    
    public typealias Coordinator = HomeCoordinator<TaskCoordinator, OnboardingCoordinator, SurveyCoordinator>
    
    @State private var coordinator: Coordinator
    
    public init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    public var body: some View {
        HomeView(viewModel: coordinator.viewModel)
            .navigationDestination(for: Coordinator.NavigationPath.self) {
                switch $0 {
                case .task(let coordinator):
                    coordinator.buildRootView()
                }
            }
            .modalSheet(container: $coordinator.modalSheetContainer) {
                switch $0.value {
                case .onboarding(let coordinator):
                    coordinator.buildRootView()
                }
            }
            .fullScreenSheet(container: $coordinator.fullScreenSheetContainer) {
                switch $0.value {
                case .survey(let coordinator):
                    coordinator.buildRootView()
                }
            }
    }
}
