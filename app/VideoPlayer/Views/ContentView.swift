//
//  ContentView.swift
//  VideoPlayer
//
//  Created by Michael Gauthier on 2025-10-31.
//

import SwiftUI
import MarkdownUI

struct ContentView: View {
    @StateObject private var videoViewModel = VideoViewModel()

    var body: some View {
        GeometryReader { geometry in
            if let currentVideo = videoViewModel.currentVideo, !videoViewModel.isLoading {
                VStack(alignment: .center) {
                    Text("Video Player")
                        .font(.largeTitle)

                    Spacer()

                    VideoPlayerView(
                        videoUrl: currentVideo.hlsURL,
                        isFirst: videoViewModel.videosIndex == 0,
                        isLast: videoViewModel.videosIndex == videoViewModel.videos.count - 1,
                        previousCallback: {
                            videoViewModel.previousVideo()
                        },
                        nextCallback: {
                            videoViewModel.nextVideo()
                        }
                    )
                    .frame(width: geometry.size.width, height: geometry.size.width * 9 / 16, alignment: .center)

                    ScrollView {
                        VStack(alignment: .leading) {
                            Text(currentVideo.title)
                                .font(.title)
                            Spacer()
                            Text(currentVideo.author.name)
                                .font(.subheadline)
                            Spacer()
                            Markdown(currentVideo.description)
                        }
                        .padding()
                    }

                    Spacer()
                }
            } else if let errorMessage = videoViewModel.errorMessage {
                // Error message view
                VStack {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                    Button("Retry") {
                        videoViewModel.loadVideos()
                    }
                }
                .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
            } else {
                ProgressView("Loading...")
                    .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
            }
        }
        .onAppear {
            videoViewModel.loadVideos()
        }
    }
}

#Preview {
    ContentView()
}
