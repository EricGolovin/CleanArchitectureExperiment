//
//  SurveyCoordinator.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import Observation
import SwiftUI

@Observable
public class SurveyCoordinator: SurveyViewModel.Delegate {
    
    let viewModel: SurveyViewModel
    private let onDismiss: () -> Void
    
    public init(
        viewModel: SurveyViewModel,
        onDismiss: @escaping () -> Void
    ) {
        self.viewModel = viewModel
        self.onDismiss = onDismiss
    }
    
    // MARK: SurveyViewModel.Delegate conformance
    
    public func surveyViewModelDidTapClose() {
        onDismiss()
    }
}
