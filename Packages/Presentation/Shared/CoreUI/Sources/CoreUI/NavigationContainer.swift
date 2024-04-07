//
//  NavigationContainer.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Observation
import SwiftUI

public protocol Coordinator: Hashable {
    associatedtype T: View
    func buildRootView() -> T
}

@Observable
public final class NavigationContainer {
    
    public var path = NavigationPath()
    
    public init() { }
    
    public func push<T: Hashable>(_ value: T) {
        path.append(value)
    }
    
    public func popLast() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    public func popToRoot() {
        path = NavigationPath()
    }
}
