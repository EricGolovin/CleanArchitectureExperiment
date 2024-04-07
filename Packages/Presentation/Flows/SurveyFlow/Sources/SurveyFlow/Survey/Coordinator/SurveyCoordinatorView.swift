//
//  SurveyCoordinatorView.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import SwiftUI

public struct SurveyCoordinatorView: View {
    
    @State private var coordinator: SurveyCoordinator
    
    public init(coordinator: SurveyCoordinator) {
        self.coordinator = coordinator
    }
    
    public var body: some View {
        SurveyView(viewModel: coordinator.viewModel)
    }
}
