//
//  VideoViewModel.swift
//  VideoPlayer
//
//  Created by Matthew Musoke on 2025-11-06.
//

import Foundation

class VideoViewModel: ObservableObject {
    @Published var videos: [VideoModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var videosIndex: Int = 0

    var currentVideo: VideoModel? {
        guard videos.indices.contains(videosIndex) else {
            return nil
        }
        return videos[videosIndex]
    }

    func loadVideos() {
        isLoading = true
        errorMessage = nil

        VideoService.shared.getVideoList { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let videos):
                    self?.videos = videos
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func previousVideo() {
        guard videosIndex > 0 else { return }
        videosIndex -= 1
    }

    func nextVideo() {
        guard videosIndex < videos.count - 1 else { return }
        videosIndex += 1
    }
}
