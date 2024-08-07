

//  VideoPlayerView.swift
//  MakeWindow
//
//  Created by 박고운 on 7/30/24.
//

import SwiftUI
import AVKit

struct VideoPlayerWindow: View {
    @State private var videoURL: URL?

    var videoURLString: String

    var body: some View {
        Group { 
            if let videoURL {
                VideoPlayer(player: AVPlayer(url: videoURL))
                    .frame(width: 1260)
                    .background(Color.gray.opacity(0.2))
                    .padding(.bottom, 84)
            } else {
                Text("비디오 파일을 찾을 수 없습니다.")
            }
        }
        .onAppear {
            videoURL = Bundle.main.url(forResource: videoURLString, withExtension: "mov")
        }
    }
}
