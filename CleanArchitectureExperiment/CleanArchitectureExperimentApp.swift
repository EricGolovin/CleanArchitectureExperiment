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
    
    @StateObject private var dependencyContainer = provideDependencyContainer()
    @State private var navigationContainer = NavigationContainer()
    
    var body: some Scene {
        WindowGroup {
            HomeCoordinatorView(coordinator: dependencyContainer.provideHomeCoordinator(navigationContainer: navigationContainer))
        }
    }
    
    private static func provideDependencyContainer() -> DependencyContainer {
        let container = DependencyContainer()
        container.registerNetworkBox()
        container.registerDatabaseBox()
        return container
    }
}
