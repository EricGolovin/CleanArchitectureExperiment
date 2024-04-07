//
//  TaskModel.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import SwiftData

@Model
public class TaskModel {
    
    public static let fetchDescriptor = FetchDescriptor<TaskModel>.self
    
    @Attribute(.unique)
    public let id: String
    
    public init(id: String) {
        self.id = id
    }
}
