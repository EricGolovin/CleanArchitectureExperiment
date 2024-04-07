//
//  TaskUseCaseRepositoryImpl.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import TaskFlowDataAPI
import DatabaseBoxAPI

public class TaskUseCaseRepositoryImpl: TaskUseCaseRepository {
    
    private let databaseService: DatabaseService
    
    public init(databaseService: DatabaseService) {
        self.databaseService = databaseService
    }
    
    public func loadTask() -> TaskEntity {
        let models: [TaskModel] = (try? databaseService.fetch(TaskModel.fetchDescriptor.init())) ?? []
        return models[0]
    }
}

extension TaskModel: TaskEntity { }
