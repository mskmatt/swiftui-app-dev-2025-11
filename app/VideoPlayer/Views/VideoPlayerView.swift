//
//  VideoPlayerView.swift
//  VideoPlayer
//
//  Created by Matthew Musoke on 2025-11-06.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @State private var player: AVPlayer?
    @State private var isPlaying = false
    @State private var isFirst = false
    @State private var isLast = false

    var body: some View {
        HStack {
            if let player {
                AVPlayerControllerRepresented(player: player)
                    .overlay(alignment: .center) {
                        HStack {
                            Button {
                                // TODO: implement previous button
                            } label: {
                                Image("previous")
                                    .disabled(isFirst)
                                    .padding()
                            }
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
                                // TODO: implement next button
                            } label: {
                                Image("next")
                                    .disabled(isLast)
                                    .padding()
                            }
                            .background(in: .circle)
                        }
                        .padding()
                    }
            }
        }
        .task {
            guard let url = URL(string: "https://d140vvwqovffrf.cloudfront.net/media/5e87b9a811599/hls/index.m3u8") else {
                return
            }
            player = AVPlayer(url: url)
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
    VideoPlayerView()
}
