//
//  Video.swift
//  youtube-oneday-build
//
//  Created by MAC on 18/05/23.
//

import Foundation

struct Video: Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        //parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        //parse the published date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)

        //parse thumbnails
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //parse video id
        let resourceIdContainer = try snippetContainer.nestedContainer(
            keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
