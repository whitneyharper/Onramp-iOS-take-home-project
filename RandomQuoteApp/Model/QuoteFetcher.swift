//
//  QuoteFetcher.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 1/9/23.
//

import Foundation

struct QuoteFetcher {
  let apiURL = "https://dummyjson.com/quotes/random"
  
  func fetchQuote(completion: @escaping (Result<Quote, Error>) -> Void) {
    let url = URL(string: apiURL)!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        completion(.failure(error))
        return
      }
      guard let data = data,
        let result = try? JSONDecoder().decode(Quote.self, from: data)
        else {
          let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to decode quote data"])
              completion(.failure(error))
              return
      }
      completion(.success(result))
    }
    task.resume()
  }
}


