//
//  AppCoordinatorView.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import SwiftUI

public struct AppCoordinatorView: View {
    
    @State private var coordinator: AppCoordinator
    
    public init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    public var body: some View {
        AppView(viewModel: coordinator.viewModel)
    }
}
