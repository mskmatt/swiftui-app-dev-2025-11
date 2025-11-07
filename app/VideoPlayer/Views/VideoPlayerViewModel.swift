//
//  VideoPlayerViewModel.swift
//  VideoPlayer
//
//  Created by Matthew Musoke on 2025-11-07.
//

import Foundation
import AVKit

@MainActor
class VideoPlayerViewModel: ObservableObject{
    static let shared = VideoPlayerViewModel()
    @Published var player: AVPlayer?
    @Published var isFirst = false
    @Published var isLast = false

    private init() {}
}
