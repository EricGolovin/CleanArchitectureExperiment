//
//  SurveyUseCase.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation

public struct SurveyUseCaseResponseModel {
 
    public init() { }
}

public protocol SurveyUseCase {
    func provideModel() -> SurveyUseCaseResponseModel
}

public protocol SurveyUseCaseRepository {
    func loadSurvey() -> SurveyEntity
}
