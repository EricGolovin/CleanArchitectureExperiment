//
//  SurveyUseCaseImpl.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import SurveyFlowDataAPI

public class SurveyUseCaseImpl: SurveyUseCase {
    
    private let repository: SurveyUseCaseRepository
    
    public init(repository: SurveyUseCaseRepository) {
        self.repository = repository
    }
    
    public func provideModel() -> SurveyUseCaseResponseModel {
        return SurveyUseCaseResponseModel()
    }
}
