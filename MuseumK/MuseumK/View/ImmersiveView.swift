//
//  ImmersiveView.swift
//  MuseumK
//
//  Created by hanseoyoung on 7/25/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @Environment(\.openWindow) var openWindow
    @State private var location: CGPoint = .zero
    @Binding var selectedObject: ROKObjectModel

    var body: some View {
        RealityView { content in
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                // Add TapComponent to entities in the scene
                content.add(scene)
            }
        }
        .hoverEffect()
        .gesture(SpatialTapGesture().targetedToAnyEntity().onEnded ({ value in
            let entity = value.entity
            let name = entity.name

            print(name)

            if let object = findObjectByCaptionName(captionName: name) {
                selectedObject = object
            }

            openWindow(id: "Commentary")
            openWindow(id: "Control")
        }))
    }

    func findObjectByCaptionName(captionName: String) -> ROKObjectModel? {
        return Objects.first { $0.captionName == captionName }
    }
}


