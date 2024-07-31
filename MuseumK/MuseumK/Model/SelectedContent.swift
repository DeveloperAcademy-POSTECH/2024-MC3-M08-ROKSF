//
//  SelectedContent.swift
//  MuseumK
//
//  Created by hanseoyoung on 8/2/24.
//

import Foundation

enum SelectedContent: String, CaseIterable {
    case info = "Info"
    case docent = "Docent"
    case video = "Video"
}


@MainActor
class SelectedRoomModel: ObservableObject {
    @Published var roomName = "Immersive"
    @Published var isImmersiveOn: Bool = false
}
