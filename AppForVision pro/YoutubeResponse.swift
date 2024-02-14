//
//  Video.swift
//  AppForVision pro
//
//  Created by Manuel Cazalla Colmenero on 12/2/24.
//

import Foundation

struct Video: Identifiable, Codable {
    let id: String
    let title: String
    let thumbnailURL: String
    let videoURL: String
}


struct YouTubeResponse: Decodable {
    struct Item: Decodable {
        struct Snippet: Decodable {
            let title: String
            let thumbnails: Thumbnails
            
        }
        struct Thumbnails: Decodable {
            struct DefaultThumbnail: Decodable {
                let url: String
            }
            let `default`: DefaultThumbnail
        }
        let snippet: Snippet
        let id: VideoId
    }

    struct VideoId: Decodable {
        let videoId: String
    }

    let items: [Item]
}
