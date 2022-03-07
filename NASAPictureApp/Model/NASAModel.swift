//
//  NASAModel.swift
//  NASAPictureApp
//
//  Created by David on 3/4/22.
//

import Foundation

struct Nasa: Decodable {
    var title: String?
    var explanation: String?
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case explanation = "explanation"
        case imageUrl = "url"
    }
}
