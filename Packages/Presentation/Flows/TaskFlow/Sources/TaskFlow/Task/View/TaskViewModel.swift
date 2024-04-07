//
//  TaskViewModel.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import Observation
import TaskFlowDataAPI

@Observable
public class TaskViewModel {
    
    var centerText = "TaskView"
    
    private let useCase: TaskUseCase
    
    public init(useCase: TaskUseCase) {
        self.useCase = useCase
    }
}
