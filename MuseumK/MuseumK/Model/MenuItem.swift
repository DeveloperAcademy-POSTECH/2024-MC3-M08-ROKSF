//
//  MenuItem.swift
//  MakeWindow
//
//  Created by 전새미 on 7/29/24.
//

import SwiftUI

enum MenuItem: String, CaseIterable, Identifiable {
    case Back
    case map
    case lights

    var id: String { self.rawValue }
}
