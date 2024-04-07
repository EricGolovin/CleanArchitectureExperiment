//
//  DependencyContainer.swift
//  CleanArchitectureExperiment
//
//  Created by Eric Golovin on 12/10/2023.
//

import Foundation

@MainActor
public protocol Resolver {
    func resolve<T>() -> T
}

public enum ContainerScope {
    /// Create a new instance on each call.
    case transient
    
    /// Create only a single instance and cache it.
    case container
}


public class DependencyContainer: ObservableObject, Resolver {
    
    private var factories: [ObjectIdentifier: @MainActor (Resolver) -> Any] = [:]
    private var containerObjects: [ObjectIdentifier: Any] = [:]
    
    // MARK: Public
    
    public func register<T>(scope: ContainerScope, factory: @MainActor @escaping (Resolver) -> T) {
        let key = key(for: T.self)
        switch scope {
        case .transient:
            factories[key] = factory
        case .container:
            factories[key] = { [weak self] resolver in
                if let instance = self?.containerObjects[key] {
                    return instance
                } else {
                    let instance = factory(resolver)
                    self?.containerObjects[key] = instance
                    return instance
                }
            }
        }
    }
    
    public func resolve<T>() -> T {
        guard let factory = factories[key(for: T.self)] else {
            fatalError("No factory found for \(T.self)")
        }
        return factory(self) as! T // swiftlint:disable:this force_cast
    }
    
    // MARK: Private
    
    private func key<T>(for type: T.Type) -> ObjectIdentifier {
        return ObjectIdentifier(T.self)
    }
}
