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
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                // Error message view
                VStack {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                    Button("Retry") {
                        viewModel.loadVideos()
                    }
                }
            } else {
                VStack(alignment: .center) {
                    VideoPlayerView()
                        .frame(width: geometry.size.width, height: geometry.size.width * 9 / 16, alignment: .center)
                    VideoDescriptionView()
                    Spacer()
                }
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
