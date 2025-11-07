//
//  VideoPlayerView.swift
//  VideoPlayer
//
//  Created by Matthew Musoke on 2025-11-06.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @ObservedObject var videoPlayerViewModel = VideoPlayerViewModel.shared
    @State private var isPlaying = false

    private var previousCallback: (() -> Void)?
    private var nextCallback: (() -> Void)?

    init(
        videoUrl: String,
        isFirst: Bool,
        isLast: Bool,
        previousCallback: (() -> Void)?,
        nextCallback: (() -> Void)?
    ) {
        self.videoPlayerViewModel.isFirst = isFirst
        self.videoPlayerViewModel.isLast = isLast
        self.previousCallback = previousCallback
        self.nextCallback = nextCallback
        guard let url = URL(string: videoUrl) else {
            return
        }
        if videoPlayerViewModel.player == nil {
            videoPlayerViewModel.player = AVPlayer(url: url)
        } else {
            videoPlayerViewModel.player?.pause()
            videoPlayerViewModel.player?.replaceCurrentItem(with: AVPlayerItem(url: url))
        }
    }

    var body: some View {
        HStack {
            if let player = videoPlayerViewModel.player {
                AVPlayerControllerRepresented(player: player)
                    .overlay(alignment: .center) {
                        HStack {
                            Button {
                                isPlaying = false
                                previousCallback?()
                            } label: {
                                Image("previous")
                                    .padding()
                            }
                            .disabled(self.videoPlayerViewModel.isFirst)
                            .background(in: .circle)
                            Spacer()
                            Button {
                                isPlaying ? player.pause() : player.play()
                                isPlaying.toggle()
                            } label: {
                                Image(isPlaying ? "pause" : "play")
                                    .padding()
                            }
                            .background(in: .circle)
                            Spacer()
                            Button {
                                isPlaying = false
                                nextCallback?()
                            } label: {
                                Image("next")
                                    .padding()
                            }
                            .disabled(self.videoPlayerViewModel.isLast)
                            .background(in: .circle)
                        }
                        .padding()
                    }
            }
        }
    }
}

struct AVPlayerControllerRepresented: UIViewControllerRepresentable {
    var player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.player?.isMuted = false
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

#Preview {
    VideoPlayerView(
        videoUrl: "https://d140vvwqovffrf.cloudfront.net/media/5e87b9a811599/hls/index.m3u8",
        isFirst: true,
        isLast: false,
        previousCallback: {
            print("previous")
        },
        nextCallback: {
            print("next")
        }
    )
}

#Preview {
    VideoPlayerView(
        videoUrl: "https://d140vvwqovffrf.cloudfront.net/media/5e852de33c8e4/hls/index.m3u8",
        isFirst: false,
        isLast: true,
        previousCallback: {
            print("previous")
        },
        nextCallback: {
            print("next")
        }
    )
}
