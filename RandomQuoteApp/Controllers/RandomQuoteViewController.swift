//
//  ViewController.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 12/26/22.
//

import UIKit

class RandomQuoteViewController: UIViewController{
  
    var favorites = [Favorite]()
    var favoritesTableViewController: FavoritesTableViewController?
    
    @IBOutlet weak var QuoteLabel: UILabel!
    @IBOutlet weak var AuthorLabel: UILabel!
    
    @IBAction func getQuote(_ sender: UIButton) {
        fetchQuote()
    }
    
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
      saveAsFavorite()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchQuote()
        //UserDefaults.standard.removeObject(forKey: "favorites")
        }
    
    let apiURL = "https://dummyjson.com/quotes/random"
    func fetchQuote() {
        let url = URL(string: apiURL)!
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                  let data = data,
                  error == nil,
                  let result = try? JSONDecoder().decode(Quote.self, from: data)
            else { return }
            
            DispatchQueue.main.async {
                self.QuoteLabel.text = "\"\(result.quote)\""
                self.AuthorLabel.text = "- \(result.author)"
            }
        }
        task.resume()
    }
    
    func saveAsFavorite(){
        let quote = QuoteLabel.text
        let author = AuthorLabel.text
        if let quote = quote, let author = author {
            
            if favoriteExists(quote: quote, author: author) {
                // Display an alert if the current quote and author combination already exists in the favorites array
                displayDuplicateFavoriteAlert()
                return
            }
            
            let favorite = Favorite(quote: quote, author: author)
            
            // Encode the favorite to a property list object
            let encoder = PropertyListEncoder()
            if let encodedFavorite = try? encoder.encode(favorite) {
                
                // Get the current favorites array from UserDefaults, or create a new empty array if none exists
                var favorites = UserDefaults.standard.array(forKey: "favorites") as? [Data] ?? [Data]()
                
                // Append the encoded favorite to the favorites array
                favorites.append(encodedFavorite)
                
                // Save the updated favorites array to UserDefaults
                UserDefaults.standard.set(favorites, forKey: "favorites")
                displayFavoriteAddedAlert()
            }
        }
    }
    
    private func favoriteExists(quote: String, author: String) -> Bool {
            let decoder = PropertyListDecoder()
            let encodedFavorites = UserDefaults.standard.array(forKey: "favorites") as? [Data] ?? [Data]()
            let favorites = encodedFavorites.compactMap { try? decoder.decode(Favorite.self, from: $0) }
            return favorites.contains(where: { $0.quote == quote && $0.author == author })
        }
    
    private func displayDuplicateFavoriteAlert() {
        let alertController = UIAlertController(title: "Already a Favorite", message: "This quote is already in your favorites.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func displayFavoriteAddedAlert() {
        let alertController = UIAlertController(title: "Added to Favorites", message: "This quote has been added to your favorites.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
