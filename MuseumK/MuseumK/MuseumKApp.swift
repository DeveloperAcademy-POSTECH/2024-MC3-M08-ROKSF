//
//  MuseumKApp.swift
//  MuseumK
//
//  Created by hanseoyoung on 7/25/24.
//

import SwiftUI

@main
struct MuseumKApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
