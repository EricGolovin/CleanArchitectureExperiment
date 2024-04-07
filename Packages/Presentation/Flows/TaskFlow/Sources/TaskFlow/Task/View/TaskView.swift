//
//  TaskView.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import SwiftUI

struct TaskView: View {
    
    @Bindable var viewModel: TaskViewModel
    
    var body: some View {
        Text(viewModel.centerText)
    }
}
