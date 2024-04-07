//
//  SurveyUseCaseRepositoryImpl.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation
import SurveyFlowDataAPI

struct SurveyEntityModelExample: SurveyEntity {
    
}

public class SurveyUseCaseRepositoryImpl: SurveyUseCaseRepository {
    
    public init() { }
    
    public func loadSurvey() -> SurveyEntity {
        return SurveyEntityModelExample()
    }
}
