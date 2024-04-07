//
//  TaskCoordinator.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import Observation
import SwiftUI

@Observable
public class TaskCoordinator {
    
    var viewModel: TaskViewModel
    
    public init(viewModel: TaskViewModel) {
        self.viewModel = viewModel
    }
}
