//
//  SheetPresentationContainer.swift
//  
//
//  Created by Eric Golovin on 10/01/2024.
//

import SwiftUI

public final class PresentationState {

    public internal(set) var isPresented: Bool {
        get {
            counter != .zero
        }
        set(presented) {
            if presented {
                counter += 1
            } else {
                counter -= 1
            }
        }
    }

    private var counter = 0
}

struct ModalSheetPresentationStateKey: EnvironmentKey {
    static let defaultValue = PresentationState()
}

struct FullScreenSheetPresentationStateKey: EnvironmentKey {
    static let defaultValue = PresentationState()
}

public extension EnvironmentValues {

    var modalSheetState: PresentationState {
        self[ModalSheetPresentationStateKey.self]
    }

    var fullScreenSheetState: PresentationState {
        self[FullScreenSheetPresentationStateKey.self]
    }
}
