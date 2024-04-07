//
//  AppView.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import SwiftUI

struct AppView: View {
    
    @Bindable var viewModel: AppViewModel
    
    var body: some View {
        Text(viewModel.centerText)
    }
}
