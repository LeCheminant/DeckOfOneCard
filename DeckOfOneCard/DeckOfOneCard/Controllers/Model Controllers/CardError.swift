//
//  CardError.swift
//  DeckOfOneCard
//
//  Created by Jacob LeCheminant on 1/21/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

import Foundation

enum CardError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
}
