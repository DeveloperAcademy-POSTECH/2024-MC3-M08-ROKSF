//
//  MuseumController.swift
//  MakeWindow
//
//  Created by 전새미 on 7/29/24.
//

import SwiftUI

struct ControlView: View {
    @State var selectedMenuItem: MenuItem = .Back
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow

    var body: some View {
        HStack(spacing: 0) {
            ForEach(MenuItem.allCases) { item in
                Button(action: {
                    withAnimation {
                        selectedMenuItem = item
                        if item == .Back {
                            presentationMode.wrappedValue.dismiss()
                        } else if item == .map {
                            dismissWindow(id: "Map")
                            openWindow(id: "Map")
                        }
                    }
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: icon(for: item))
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                        Text(item.rawValue)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(10)
                }
                .buttonStyle(.plain)
                .padding()
            }
        }
        .background(Color.gray.opacity(0.5))
        .glassBackgroundEffect()
        .cornerRadius(23)
        .padding(0)
    }

    func icon(for item: MenuItem) -> String {
        switch item {
        case .Back:
            return "arrow.backward"
        case .map:
            return "map.fill"
        case .lights:
            return "lightbulb.max"
        }
    }
}


