//
//  Favorite.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 12/27/22.
//

import Foundation

struct Favorite: Codable {
  let quote: String
  let author: String
}

extension Favorite: Equatable {
    static func == (lhs: Favorite, rhs: Favorite) -> Bool {
        return lhs.quote == rhs.quote && lhs.author == rhs.author
    }
}


