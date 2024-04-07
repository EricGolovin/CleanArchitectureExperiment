//
//  AppCoordinator.swift
//  
//
//  Created by Erik Golovin on 02/04/2024.
//

import Observation
import SwiftUI

@Observable
public class AppCoordinator {
    
    var viewModel: AppViewModel
    
    public init(
        viewModel: AppViewModel,
        @ViewBuilder homeView: () -> some View,
        @ViewBuilder profileView: () -> some View,
        @ViewBuilder surveyView: () -> some View
    ) {
        self.viewModel = viewModel
    }
}
