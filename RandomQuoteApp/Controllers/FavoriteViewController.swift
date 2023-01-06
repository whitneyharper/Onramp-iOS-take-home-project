//
//  DetailViewController.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 12/27/22.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    var favorite: Favorite?
    var favoritesTableViewController: FavoritesTableViewController?

    @IBOutlet weak var QuoteLabel: UILabel!
    @IBOutlet weak var AuthorLabel: UILabel!
    
    @IBAction func deleteButton(_ sender: UIBarButtonItem) {
        // Get the encoded favorites array from UserDefaults
            var encodedFavorites = UserDefaults.standard.array(forKey: "favorites") as? [Data] ?? [Data]()
            // Find the index of the encoded favorite that corresponds to the currently shown favorite
            if let index = encodedFavorites.firstIndex(where: { (encodedFavorite) -> Bool in
                let decoder = PropertyListDecoder()
                if let decodedFavorite = try? decoder.decode(Favorite.self, from: encodedFavorite) {
                    return decodedFavorite == favorite
                }
                return false
            }) {
                // Remove the encoded favorite from the array
                encodedFavorites.remove(at: index)
                // Save the updated encoded favorites array to UserDefaults
                UserDefaults.standard.set(encodedFavorites, forKey: "favorites")
            }
        
        if let favorite = favorite {
            
            // Find the index of the favorite in the favorites array
            if let index = favoritesTableViewController?.favorites.firstIndex(of: favorite) {
                // Remove the favorite from the array
                favoritesTableViewController?.favorites.remove(at: index)
            }
            // Reload the table view
            favoritesTableViewController?.tableView.reloadData()
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let favorite = favorite {
            QuoteLabel.text = favorite.quote
            AuthorLabel.text = favorite.author
        }
    }
}
