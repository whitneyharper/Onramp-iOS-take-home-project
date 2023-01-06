//
//  Quote.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 12/26/22.
//

import Foundation

struct Quote: Decodable {
    let id: Int
    let quote: String
    let author: String
}
