//
//  DetailViewController.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 12/27/22.
//

import UIKit

class FavoriteQuoteViewController: UIViewController {
    
    var favorite: Favorite?
    var favoritesTableViewController: FavoritesTableViewController?

    var contentView = FavoriteQuoteView()
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(contentView == self.view)
        
        let delete = UIBarButtonItem(image: UIImage(systemName: "trash.fill"), style: .plain, target: self, action: #selector(deleteButton(_:)))
        let share = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up.fill"), style: .plain, target: self, action: #selector(shareButton(_:)))
        self.navigationItem.rightBarButtonItems = [delete, share]
        
        if let favorite = favorite {
            self.contentView.quoteLabel.text = favorite.quote
            self.contentView.authorLabel.text = favorite.author
        }
    }
    
    @objc func deleteButton(_ sender: UIBarButtonItem) {
          deleteFavorite()
    }
    
    @objc func shareButton(_ sender: UIBarButtonItem){
        shareFavorite()
    }
    
    func deleteFavorite(){
        var encodedFavorites = UserDefaults.standard.array(forKey: "favorites") as? [Data] ?? [Data]()
        
        if let index = encodedFavorites.firstIndex(where: { (encodedFavorite) -> Bool in
            let decoder = PropertyListDecoder()
            if let decodedFavorite = try? decoder.decode(Favorite.self, from: encodedFavorite) {
                return decodedFavorite == favorite
            }
            return false
        })
        {
            encodedFavorites.remove(at: index)
            UserDefaults.standard.set(encodedFavorites, forKey: "favorites")
        }
        if let favorite = favorite {
            if let index = favoritesTableViewController?.favorites.firstIndex(of: favorite) {
                favoritesTableViewController?.favorites.remove(at: index)
            }
            favoritesTableViewController?.tableView.reloadData()
        }
        navigationController?.popViewController(animated: true)
        }
    
    func shareFavorite(){
        if let quote = favorite?.quote, let author = favorite?.author {
            let favorite = "\(quote)  \(author)"
            let activityViewController = UIActivityViewController(activityItems: [favorite], applicationActivities: nil)
            present(activityViewController, animated: true)
        } else {
            return
        }
    }
}
