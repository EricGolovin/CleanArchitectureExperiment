//
//  CleanArchitectureExperimentApp.swift
//  CleanArchitectureExperiment
//
//  Created by Erik Golovin on 02/04/2024.
//

import SwiftUI
import CoreUI
import HomeFlow

@main
struct CleanArchitectureExperimentApp: App {
    
    @State private var dependencyContainer: DependencyContainer
    @State private var navigationContainer: NavigationContainer
    @State private var homeCoordinator: DependencyContainer.HomeFlowCoordinator
    
    init() {
        let dependencyContainer = Self.provideDependencyContainer()
        self.dependencyContainer = dependencyContainer
        
        let navigationContainer = NavigationContainer()
        self.navigationContainer = navigationContainer
        
        self.homeCoordinator = dependencyContainer.provideHomeCoordinator(navigationContainer: navigationContainer)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationContainer.path) {
                HomeCoordinatorView(coordinator: homeCoordinator)
            }
        }
    }
    
    @MainActor
    private static func provideDependencyContainer() -> DependencyContainer {
        let container = DependencyContainer()
        container.registerNetworkBox()
        container.registerDatabaseBox()
        return container
    }
}
