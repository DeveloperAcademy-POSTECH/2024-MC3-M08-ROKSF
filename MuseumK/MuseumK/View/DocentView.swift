//
//  DocentView.swift
//  MuseumK
//
//  Created by hanseoyoung on 7/31/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct DocentView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow

    @Binding var isObjectShowing: Bool
    @Binding var isSoundPlaying: Bool
    
    @State var object: ROKObjectModel
    @State private var showVideoWindow = false
    @State private var isImmersiveSoundOn = false
    @State private var isDocentOpen = false

    private let soundManager = SoundManager.instance

    var body: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                ZStack() {
                    Image("\(object.docentPhoto)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 460, height: 460)
                        .cornerRadius(20)
                    VStack() {
                        Spacer()

                        HStack() {
                            Spacer()

                            Toggle(isOn: $isObjectShowing) {
                                Image(systemName: "rotate.3d.fill")
                                    .font(.title)
                                    .padding(.leading, 11)
                                Text("3D Object")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .padding(17)
                                    .clipShape(Capsule())
                            }
                            .onChange(of: isObjectShowing) { _, newValue in
                                if newValue {
                                    //dismissWindow(id: "Volume")
                                    openWindow(id: "Volume")
                                } else {
                                    dismissWindow(id: "Volume")
                                }
                            }
                            .toggleStyle(.button)

                            Toggle(isOn: $isSoundPlaying) {
                                Image(systemName: "headphones")
                                    .font(.title)
                                    .padding(.leading, 11)
                                Text("Sounds")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .padding(17)
                                    .clipShape(Capsule())
                            }
                            .onChange(of: isSoundPlaying) { _, newValue in
                                if newValue {
                                    soundManager.playSound(sound: object.soundName)
                                } else {
                                    soundManager.soundOff()
                                }
                            }
                            .toggleStyle(.button)

                            Spacer()
                        }

                        .padding(.bottom, 22.55)
                    }
                    .frame(width: 460, height: 460)
                }

                VStack(alignment: .leading){
                    HStack() {
                        VStack(alignment: .leading) {
                            Text("\(object.docentTitle)")
                                .font(.system(size: 34))
                                .fontWeight(.bold)
                        }

                        Spacer()

                    }
                    .padding(.bottom, 53)

                    ScrollView() {
                        Text(.init(object.docentContent))
                            .fontWeight(.light)
                            .font(.system(size: 20))
                    }
                }
                .foregroundColor(.white)
                .padding(20)

                Spacer()
            }
            .padding(.vertical, 10)

            Spacer()
        }
        .padding(.horizontal, 20)
    }
}
