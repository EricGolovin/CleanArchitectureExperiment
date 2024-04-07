//
//  SurveyView.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import SwiftUI

struct SurveyView: View {
    
    @Bindable var viewModel: SurveyViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.centerText)
            
            Button("Close Survey") {
                viewModel.closeTapped()
            }
            .frame(height: 44)
            .buttonStyle(.bordered)
        }
    }
}
