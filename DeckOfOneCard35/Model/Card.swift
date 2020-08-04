//
//  Card.swift
//  DeckOfOneCard35
//
//  Created by Colton Swapp on 8/4/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import Foundation

struct Card: Decodable {
    let value: String
    let suit: String
    let image: URL
    
}
struct TopLevelObject: Decodable {
    let cards: [Card]
}
