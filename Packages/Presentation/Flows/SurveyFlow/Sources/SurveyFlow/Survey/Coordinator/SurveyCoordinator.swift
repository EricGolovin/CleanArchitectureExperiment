//
//  SurveyCoordinator.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import Observation
import SwiftUI
import CoreUI

@Observable
public class SurveyCoordinator: SurveyViewModel.Delegate, Coordinator {
    
    fileprivate let id = UUID()
    
    let viewModel: SurveyViewModel
    private let onDismiss: () -> Void
    
    public init(
        viewModel: SurveyViewModel,
        onDismiss: @escaping () -> Void
    ) {
        self.viewModel = viewModel
        self.onDismiss = onDismiss
    }
    
    public static func == (lhs: SurveyCoordinator, rhs: SurveyCoordinator) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public func buildRootView() -> SurveyCoordinatorView {
        SurveyCoordinatorView(coordinator: self)
    }
    
    // MARK: SurveyViewModel.Delegate conformance
    
    public func surveyViewModelDidTapClose() {
        onDismiss()
    }
}
