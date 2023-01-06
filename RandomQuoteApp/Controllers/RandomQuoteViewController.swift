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
    
   var randomView = RandomQuoteView()
    
    override func loadView() {
        self.view = randomView
        fetchQuote()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(randomView == self.view)
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
                self.randomView.quoteLabel.text = "\"\(result.quote)\""
                self.randomView.authorLabel.text = "- \(result.author)"
            }
        }
        task.resume()
    }
    
    @objc func randomButtonPressed(_ sender: UIButton) {
        fetchQuote()
    }
    
    @objc func favoriteButtonPressed(_ sender: UIButton){
        saveAsFavorite()
    }
    
    func saveAsFavorite(){
        let quote = self.randomView.quoteLabel.text
        let author = self.randomView.authorLabel.text
        if let quote = quote, let author = author {
            
            if favoriteExists(quote: quote, author: author) {
                displayDuplicateFavoriteAlert()
                return
            }
            
            let favorite = Favorite(quote: quote, author: author)
            
            let encoder = PropertyListEncoder()
            
            if let encodedFavorite = try? encoder.encode(favorite) {
                var favorites = UserDefaults.standard.array(forKey: "favorites") as? [Data] ?? [Data]()
                favorites.append(encodedFavorite)
                UserDefaults.standard.set(favorites, forKey: "favorites")
                displayFavoriteAddedAlert()
            }
        }
    }
    
    func favoriteExists(quote: String, author: String) -> Bool {
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
        let alertController = UIAlertController(title: nil, message: "Favorite added!", preferredStyle: .alert)
        alertController.modalPresentationStyle = .overCurrentContext
        present(alertController, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
        alertController.dismiss(animated: true)
        }
    }
}
