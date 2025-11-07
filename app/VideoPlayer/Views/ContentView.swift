//
//  ContentView.swift
//  VideoPlayer
//
//  Created by Michael Gauthier on 2025-10-31.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = VideoViewModel()

    var body: some View {
        GeometryReader { geometry in
            if viewModel.videos.indices.contains(viewModel.videosIndex) && !viewModel.isLoading {
                VStack(alignment: .center) {
                    VideoPlayerView(
                        videoUrl: viewModel.videos[viewModel.videosIndex].hlsURL,
                        isFirst: viewModel.videosIndex == 0,
                        isLast: viewModel.videosIndex == viewModel.videos.count - 1,
                        previousCallback: {
                            viewModel.videosIndex -= 1
                        },
                        nextCallback: {
                            viewModel.videosIndex += 1
                        }
                    )
                    .frame(width: geometry.size.width, height: geometry.size.width * 9 / 16, alignment: .center)
                    VideoDescriptionView()
                    Spacer()
                }
            } else if let errorMessage = viewModel.errorMessage {
                // Error message view
                VStack {
                    Text("Error: \(viewModel.errorMessage ?? "")")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                    Button("Retry") {
                        viewModel.loadVideos()
                    }
                }
                .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
            } else {
                ProgressView("Loading...")
                    .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
            }
        }
        .onAppear {
            viewModel.loadVideos()
        }
    }
}

#Preview {
    ContentView()
}
