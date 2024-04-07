//
//  SheetContainer.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation

@Observable
public final class SheetContainer<Path: Identifiable> {
    
    public var path: Path? {
        didSet {
            if path == nil {
                navigationContainer.popLast()
            }
        }
    }
    
    private let navigationContainer: NavigationContainer
    
    public init(_ navigationContainer: NavigationContainer) {
        self.navigationContainer = navigationContainer
    }
}
