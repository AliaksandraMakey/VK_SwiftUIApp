//
//  DetachableObject.swift
//  VK_SwiftUI
//
//  Created by aaa on 20/04/2023.
//

import Foundation
import RealmSwift

// MARK: - extension for Object
extension Object: DetachableObject {
    // detached
    func detached() -> Self {
        let detached = type(of: self).init()
        for property in objectSchema.properties {
            guard let value = value(forKey: property.name) else {
                continue
            }
            if let detachable = value as? DetachableObject {
                detached.setValue(detachable.detached(), forKey: property.name)
            } else {
                detached.setValue(value, forKey: property.name)
            }
        }
        return detached
    }
}
