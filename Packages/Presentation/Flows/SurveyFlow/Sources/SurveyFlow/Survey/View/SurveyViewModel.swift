//
//  SurveyViewModel.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import Observation
import SurveyFlowDataAPI

@Observable
public class SurveyViewModel {
    
    public protocol Delegate: AnyObject {
        func surveyViewModelDidTapClose()
    }
    
    var centerText = "SurveyView"
    
    public weak var delegate: Delegate?
    
    private let useCase: SurveyUseCase
    
    public init(useCase: SurveyUseCase) {
        self.useCase = useCase
    }
    
    // MARK: Action handlers
    
    func closeTapped() {
        delegate?.surveyViewModelDidTapClose()
    }
}
