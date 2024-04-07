//
//  HomeView.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import SwiftUI

struct HomeView: View {
    
    @Bindable var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.centerText)
            
            Button("Open Task") {
                viewModel.openTaskTapped()
            }
            .frame(height: 44)
            .buttonStyle(.borderedProminent)
            
            Button("Open Onboarding") {
                viewModel.openOnboardingTapped()
            }
            .frame(height: 44)
            .buttonStyle(.bordered)
            
            Button("Open Survey") {
                viewModel.openSurveyTapped()
            }
            .frame(height: 44)
            .buttonStyle(.bordered)
            
            Text("\(viewModel.counter)")
        }
    }
}
