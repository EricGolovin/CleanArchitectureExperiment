//
//  TaskCoordinatorView.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import SwiftUI

public struct TaskCoordinatorView: View {
    
    @State private var coordinator: TaskCoordinator
    
    public init(coordinator: TaskCoordinator) {
        self.coordinator = coordinator
    }
    
    public var body: some View {
        TaskView(viewModel: coordinator.viewModel)
    }
}
