//
//  ContentManageView.swift
//  MuseumK
//
//  Created by hanseoyoung on 8/2/24.
//

import SwiftUI

struct ContentManageView: View {
    @State private var preselectedIndex: SelectedContent = .info
    @State var selectedObject: ROKObjectModel
    @State var isObjectShowing = false
    @State var isSoundPlaying = false

    @EnvironmentObject var model: SelectedRoomModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    HStack() {
                        NavigationLink(destination: PosterView()
                            .environmentObject(model)) {
                                Label("Map", systemImage: "map.fill")
                                    .fontWeight(.bold)
                                    .font(.system(size: 20))
                                    .padding(.horizontal, 20)
                            }
                            .padding(.leading, 34)

                        Spacer()
                    }

                    HStack(alignment: .center, spacing: 10) {
                        ForEach(SelectedContent.allCases, id: \.self) { content in
                            ZStack {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(width: 79, height: 35)
                                    .hoverEffect()

                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .padding(2)
                                    .frame(width: 79, height: 35)
                                    .opacity(preselectedIndex == content ? 0.5 : 0.01)
                                    .hoverEffect()
                            }
                            .onTapGesture(count: 1, perform: {
                                withAnimation(.interactiveSpring()) {
                                    DispatchQueue.main.async {
                                        preselectedIndex = content
                                    }
                                }
                            })
                            .overlay(
                                Text(content.rawValue)
                                    .foregroundColor(.white)
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                            )
                        }
                    }
                    .padding(.vertical, 34)
                    Spacer()
                }
                if preselectedIndex == .info {
                    CommentaryView(isObjectShowing: $isObjectShowing, isSoundPlaying: $isSoundPlaying, object: selectedObject)
                } else if preselectedIndex == .docent {
                    DocentView(isObjectShowing: $isObjectShowing, isSoundPlaying: $isSoundPlaying, object: selectedObject)
                } else if preselectedIndex == .video {

                    VideoPlayerWindow(videoURLString: selectedObject.video)
                }

            }
        }

    }
}
