//
//  FavoriteQuotesTableViewController.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 12/27/22.
//

import UIKit

class FavoritesTableViewController: UITableViewController{
    
    let cellId = "favoriteCell"
    var favorites = [Favorite]()
    var filteredFavorites = [Favorite]()
    let searchController = UISearchController(searchResultsController: nil)
   
    var searchBarIsEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
      }

    func filterContentForSearchText(_ searchText: String) {
        filteredFavorites = favorites.filter { favorite in
            return favorite.author.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.title = "Favorites"
     
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Author"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false     
        definesPresentationContext = true
        
        tableView.dataSource = self
        
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
           let encodedFavorites = UserDefaults.standard.array(forKey: "favorites") as? [Data] ?? [Data]()
           
           let decoder = PropertyListDecoder()
           favorites = encodedFavorites.compactMap { try? decoder.decode(Favorite.self, from: $0) }
       
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredFavorites.count
        }
        return favorites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
       
        let favorite: Favorite
            if isFiltering {
                favorite = filteredFavorites[indexPath.row]
            } else {
                favorite = favorites[indexPath.row]
            }
        cell.textLabel?.text = favorite.author.replacingOccurrences(of: "-", with: "")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchController.isActive {
            let selectedFavorite = filteredFavorites[indexPath.row]
            let favoriteVC = FavoriteQuoteViewController()
                favoriteVC.favorite = selectedFavorite
                favoriteVC.favoritesTableViewController = self
                navigationController?.pushViewController(favoriteVC, animated: true)
        } else {
            let selectedFavorite = favorites[indexPath.row]
            let favoriteVC = FavoriteQuoteViewController()
                favoriteVC.favorite = selectedFavorite
                favoriteVC.favoritesTableViewController = self
                navigationController?.pushViewController(favoriteVC, animated: true)
        }
    }
}

extension FavoritesTableViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
      filterContentForSearchText(searchController.searchBar.text!)
    }
}
