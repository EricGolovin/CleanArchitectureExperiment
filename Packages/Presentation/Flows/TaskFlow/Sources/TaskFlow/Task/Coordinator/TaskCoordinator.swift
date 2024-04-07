//
//  TaskCoordinator.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import Observation
import SwiftUI
import CoreUI

@Observable
public class TaskCoordinator: Coordinator {
    
    fileprivate let id = UUID()
    
    var viewModel: TaskViewModel
    
    public init(viewModel: TaskViewModel) {
        self.viewModel = viewModel
    }
    
    public static func == (lhs: TaskCoordinator, rhs: TaskCoordinator) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public func buildRootView() -> TaskCoordinatorView {
        TaskCoordinatorView(coordinator: self)
    }
}
