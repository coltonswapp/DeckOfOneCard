//
//  CardController.swift
//  DeckOfOneCard35
//
//  Created by Colton Swapp on 8/4/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import Foundation
import class UIKit.UIImage

class CardController {
    
    static func fetchCard(completion: @escaping (Result <Card, CardError>) -> Void) {
        // Prepare the URL
        guard let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1") else {
            return completion(.failure(.invalidURL))}
        let finalURL = baseURL
        print(finalURL)
        // Contact the server with a URLSession Datatask
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            
            // Handle Errors from the server
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            // Check & Guard the data receieved from the served
            guard let data = data else { return completion(.failure(.noData))}
            // Decode the JSON
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                guard let card = topLevelObject.cards.first else { return completion(.failure(.noData))}
                return completion(.success(card))
            } catch {
                return completion(.failure(.unableToDecode))
            }
            
            } .resume()
        
    }
    
    static func fetchImage(for card: Card, completion: @escaping (Result <UIImage, CardError> ) -> Void) {
        let cardImageURL = card.image
        
        URLSession.shared.dataTask(with: cardImageURL) { (data, _, error) in
            if let error = error {
                completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData))}
            
            guard let cardImage = UIImage(data: data) else { return completion(.failure(.unableToDecode))}
            return completion(.success(cardImage))
            } .resume()
    }
    
}
