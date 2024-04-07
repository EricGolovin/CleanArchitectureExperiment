//
//  SheetContainer.swift
//
//
//  Created by Erik Golovin on 03/04/2024.
//

import Foundation

@Observable
public final class SheetContainer<Path: Hashable> {
    
    public struct IdentifiableAdapter: Identifiable {
        
        public var id: Int { value.hashValue }
        
        public let value: Path
    }
    
    public var path: IdentifiableAdapter? {
        didSet {
            if path == nil {
                navigationContainer.popLast()
            }
        }
    }
    
    public func setPath(_ path: Path) {
        self.path = IdentifiableAdapter(value: path)
    }
    
    private let navigationContainer: NavigationContainer
    
    public init(_ navigationContainer: NavigationContainer) {
        self.navigationContainer = navigationContainer
    }
}
