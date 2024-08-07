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

    @StateObject private var selectedRoomModel = SelectedRoomModel()

    var body: some Scene {
        WindowGroup(id: "Entering") {
            EnteringView()
                .environmentObject(selectedRoomModel)
        }
        .windowResizability(.contentSize)

        WindowGroup(id: "ContentManage") {
            ContentManageView(selectedObject: selectedObject)
                .environmentObject(selectedRoomModel)
        }
        .windowResizability(.contentSize)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView(selectedObject: $selectedObject)
                .environmentObject(selectedRoomModel)
        }
        .immersionStyle(selection: $style, in: .full)

        WindowGroup(id: "Volume") {
            VolumeView(objectVolumeName: selectedObject.volumeID)
        }
        .windowStyle(.volumetric)
        .windowResizability(.contentSize)
        
    }
}
