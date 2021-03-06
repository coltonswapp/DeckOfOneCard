//
//  CardError.swift
//  DeckOfOneCard35
//
//  Created by Colton Swapp on 8/4/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import Foundation

enum CardError: LocalizedError {
    
     case invalidURL
     case thrownError(Error)
     case noData
     case unableToDecode
     
     var errorDescription: String? {
         switch self {
         case .invalidURL:
             return "Unable to reach the server. Invalid URL."
             
         case .thrownError(let error):
             return error.localizedDescription
             
         case .noData:
             return "The server responded with no data"
             
         case .unableToDecode:
             return "The server responded with bad data"
         }
     }
}
