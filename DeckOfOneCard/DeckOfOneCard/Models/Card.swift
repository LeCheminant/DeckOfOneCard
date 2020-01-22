//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Jacob LeCheminant on 1/21/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

import Foundation

struct Card: Decodable {
    let value: String
    let suit: String
    let image: URL
    
//    struct Image: Decodable {
//        let classic: URL
//
//        enum CodingKeys: String, CodingKey {
//            case classic = "image"
//        }
//    }
}

struct TopLevelObject: Decodable {
    var cards: [Card]
}
