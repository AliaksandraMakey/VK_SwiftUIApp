//
//  ProtocolDetachableObject.swift
//  VK_SwiftUI
//
//  Created by aaa on 01/05/2023.
//

import Foundation
import RealmSwift

// MARK: - protocol DetachableObject
protocol DetachableObject: AnyObject {
    // detached
    func detached() -> Self
}
