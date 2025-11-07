//
//  VideoService.swift
//  VideoPlayer
//
//  Created by Matthew Musoke on 2025-11-06.
//

import Foundation
import Alamofire

protocol VideoServiceProtocol: AnyObject {
    func getVideoList(completion: @escaping (Result<[VideoModel], AFError>) -> Void)
}

class VideoService: VideoServiceProtocol {
    static let shared = VideoService()

    private init() {}

    func getVideoList(completion: @escaping (Result<[VideoModel], AFError>) -> Void) {
        AF.request("http://localhost:4000/videos", method: .get)
            .validate()
            .responseDecodable(of: [VideoModel].self) { response in
                switch response.result {
                case .success(var videos):
                    videos.sort {
                        guard let firstDate = $0.publishedAtDate,
                              let secondDate = $1.publishedAtDate
                        else {
                            return $0.publishedAt.compare($1.publishedAt) == .orderedDescending
                        }
                        return firstDate.compare(secondDate) == .orderedDescending
                    }
                    completion(.success(videos))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
