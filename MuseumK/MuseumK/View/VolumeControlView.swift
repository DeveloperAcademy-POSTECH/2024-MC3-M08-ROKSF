//
//  VolumeControlView.swift
//  MuseumK
//
//  Created by hanseoyoung on 8/6/24.
//

import SwiftUI

struct VolumeControlView: View {
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow

    @State private var isToggleOn: Bool = false

    var body: some View {
        HStack() {
            Toggle(isOn: $isToggleOn) {
                Label("비상", systemImage: "visionpro.badge.exclamationmark")
            }
        }
        .toggleStyle(.button)
        .buttonStyle(.borderless)
        .labelStyle(.iconOnly)
        .onChange(of: isToggleOn) { oldValue, newValue in
            if newValue {
                openWindow(id: "Entering")
            } else {
                dismissWindow(id: "Entering")
            }
        }
    }
}
