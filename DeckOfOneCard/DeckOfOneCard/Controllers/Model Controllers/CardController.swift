//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Jacob LeCheminant on 1/21/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

import Foundation
import UIKit.UIImage

class CardController {
    
    static func fetchCard(completion: @escaping (Result <Card, CardError>) -> Void) {
        
        guard let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/") else { return completion(.failure(.invalidURL))}
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let countItem = URLQueryItem(name: "count", value: "1")
        components?.queryItems = [countItem]
        guard let finalURL = components?.url else {return completion(.failure(.invalidURL)) }
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData))}
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                guard let card = topLevelObject.cards.first else { return completion(.failure(.noData))}
                return completion(.success(card))
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchImage(for card: Card, completion: @escaping (Result <UIImage, CardError>) -> Void) {
        // 1 - Prepare URL
        let url = card.image
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData))}
            
            guard let image = UIImage(data: data) else { return completion(.failure(.unableToDecode))}
            completion(.success(image))
        }.resume()
        // 2 - Contact server
        
        // 3 - Handle errors from the server
        
        // 4 - Check for image date
        
        // 5 - Initialize an image from the data
    }
}
