//
//  DetachableObject.swift
//  VK_SwiftUI
//
//  Created by aaa on 20/04/2023.
//

import Foundation
import RealmSwift

protocol DetachableObject: AnyObject {
    func detached() -> Self
}

extension Object: DetachableObject {
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

extension List: DetachableObject {
    func detached() -> List<Element> {
        let result = List<Element>()
        forEach {
            if let detachableObject = $0 as? DetachableObject,
               let element = detachableObject.detached() as? Element {
                result.append(element)
            } else {
                result.append($0)
            }
        }
        return result
    }
}