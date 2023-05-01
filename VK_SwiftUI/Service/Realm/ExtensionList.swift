//
//  ExtensionList.swift
//  VK_SwiftUI
//
//  Created by aaa on 01/05/2023.
//

import Foundation
import RealmSwift

// MARK: - extension for List
extension List: DetachableObject {
    // detached
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
