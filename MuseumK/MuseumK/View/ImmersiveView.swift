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
    @Environment(\.dismissWindow) var dismissWindow
    @State private var location: CGPoint = .zero
    @Binding var selectedObject: ROKObjectModel

    @EnvironmentObject var model: SelectedRoomModel

    var body: some View {
        RealityView { content in
            if let scene = try? await Entity(named: "\(model.roomName)", in: realityKitContentBundle) {
                print(model.roomName)
                content.add(scene)

                guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
                let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
                scene.components.set(iblComponent)
                scene.components.set(ImageBasedLightReceiverComponent(imageBasedLight: scene))
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
            dismissWindow(id: "ContentManage")
            openWindow(id: "ContentManage")
        }))
        .onAppear {
            dismissWindow(id: "Entering")
            dismissWindow(id: "ContentManage")
            dismissWindow(id: "Volume")
        }
    }

    func findObjectByCaptionName(captionName: String) -> ROKObjectModel? {
        return Objects.first { $0.captionName == captionName }
    }
}


