//
//  MapWindow.swift
//  samplePJ
//
//  Created by 박고운 on 7/29/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct MapView: View {
    @State private var selectedRoom: String? = nil
    @State private var navigateToRoom: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HStack {
                    Spacer()
                    Text("Map of the Exhibition")
                        .font(.title)
                        .font(.system(size: 29))
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.top, 28)
                // Room Buttons
                VStack {
                    // RoomA, RoomB
                    HStack {
                        roomButton(title: "Room A", locked: false) {
                            selectedRoom = "Room A"
                            navigateToRoom = true
                        }

                        roomButton(title: "Room B", locked: true) {
                        }
                    }

                    HStack {
                        roomButton(title: "Room C", locked: true) {

                        }
                        
                        roomButton(title: "Room D", locked: true) {

                        }
                    }
                }
            }
            .padding()
            .frame(width: 546, height: 430)
            .navigationDestination(isPresented: $navigateToRoom) {
                if let selectedRoom = selectedRoom {
                    //RoomView(roomName: selectedRoom)
                }
            }
        }
    }

    @ViewBuilder
    private func roomButton(title: String, locked: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(alignment:.center) {
                Text(title)
                    .padding(.bottom, 10)
                if locked {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.white)
                }
            }
            .frame(width: 195, height: 139)
        }
        .background(Color.gray)
        .opacity(locked ? 0.3 : 1.0)
        .cornerRadius(10)
        .foregroundColor(.white)
        .buttonStyle(.plain)
        .buttonBorderShape(.roundedRectangle(radius: 10))
        .frame(width: 195, height: 139)
        .padding(.bottom, 24)
        .padding(.trailing, 24)
    }
}

