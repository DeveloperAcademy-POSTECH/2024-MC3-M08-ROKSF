//
//  MuseumKApp.swift
//  MuseumK
//
//  Created by hanseoyoung on 7/25/24.
//

import SwiftUI
import RealityKitContent

@main
struct MuseumKApp: App {
    init() {
        RealityKitContent.GestureComponent.registerComponent()
    }

    @State private var style: ImmersionStyle = .full
    @State var selectedObject: ROKObjectModel = Objects[0]
    
    var body: some Scene {
        WindowGroup(id: "Content") {
            ContentView()
        }

        WindowGroup(id: "Control") {
            ControlView()
        }
        .defaultSize(width: 377, height: 90)

        WindowGroup(id: "Commentary", content: {
            CommentaryView(object: selectedObject)
        })

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView(selectedObject: $selectedObject)
        }
        .immersionStyle(selection: $style, in: .full)

        WindowGroup(id: "Volume") {
            VolumeView(objectVolumeName: selectedObject.volumeID)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 2, height: 1.75, depth: 1, in: .meters)


        WindowGroup(id: "Map") {
            MapView()
        }
        .defaultSize(width: 546, height: 430)
    }
}
