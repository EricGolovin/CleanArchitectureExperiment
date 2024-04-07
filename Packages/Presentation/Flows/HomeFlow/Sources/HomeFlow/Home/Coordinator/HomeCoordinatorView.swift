//
//  HomeCoordinatorView.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import SwiftUI

public struct HomeCoordinatorView<TaskView: View, OnboardingView: View, SurveyView: View>: View {
    
    @State private var coordinator: HomeCoordinator<TaskView, OnboardingView, SurveyView>
    
    public init(coordinator: HomeCoordinator<TaskView, OnboardingView, SurveyView>) {
        self.coordinator = coordinator
        
        print("⭐️ HomeCoordinatorView init")
    }
    
    public var body: some View {
        HomeView(viewModel: coordinator.viewModel)
            .navigationDestination(for: HomeCoordinator.NavigationPath.self) {
                coordinator.buildView(for: $0)
            }
            .modalSheet(container: $coordinator.modalSheetContainer) { path in
                coordinator.buildView(for: path)
            }
            .fullScreenSheet(container: $coordinator.fullScreenSheetContainer) {
                coordinator.buildView(for: $0)
            }
    }
}
