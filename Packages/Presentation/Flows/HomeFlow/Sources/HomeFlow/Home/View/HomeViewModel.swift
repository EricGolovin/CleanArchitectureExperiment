//
//  HomeViewModel.swift
//
//
//  Created by Erik Golovin on 02/04/2024.
//

import Observation
import HomeFlowDataAPI

@Observable
public class HomeViewModel {
    
    public protocol Delegate: AnyObject {
        func homeViewModelDidTapTask()
        func homeViewModelDidTapOnboarding()
        func homeViewModelDidTapSurvey()
    }
    
    var centerText = "HomeView"
    var counter = 0
    
    public weak var delegate: Delegate?
    
    private let useCase: HomeUseCase
    
    public init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    // MARK: Action handlers
    
    func openTaskTapped() {
        delegate?.homeViewModelDidTapTask()
        counter += 1
    }

    func openOnboardingTapped() {
        delegate?.homeViewModelDidTapOnboarding()
        counter += 1
    }
    
    func openSurveyTapped() {
        delegate?.homeViewModelDidTapSurvey()
        counter += 1
    }
}
