//
//  Session.swift
//  VK_SwiftUI
//
//  Created by aaa on 19/04/2023.
//

import SwiftUI
class Session: ObservableObject {

    static let shared = Session()

    private init() {}

    @Published var isAuthorized: Bool = false
    @Published var token = "k1.a.XPSCcD0uEfuy0M2q7zxw6gm6D5-jxNC05BPZvg6_DMTB_K9WmOSGEq6y3kQD52f5TJ3WFLJf94Zi-ANGHTqkb-oRKuh74ke-dIosUs1wRV_FrmZ2brtF0P54wipvmWYfmvFg0qiYN1wlFdlVkd4-gOxLOLGcB5eOxJ-xKHrwWXPCj3yRw6MB5RrtlP4WcdfdPsn12i8ccSRi41tfb8oPvA"
    @Published var userId = ""
    @Published var expiresInDate: Date?
//    @Published var version = "5.131"
//    @Published var cliendId = "51619940"
    
}
