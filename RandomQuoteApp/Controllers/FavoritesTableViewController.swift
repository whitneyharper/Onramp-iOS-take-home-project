//
//  FavoriteQuotesTableViewController.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 12/27/22.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    
    var favorites = [Favorite]()
    var filteredFavorites = [Favorite]()
    let searchController = UISearchController(searchResultsController: nil)
   
    var searchBarIsEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
      }

    private func filterContentForSearchText(_ searchText: String) {
        // Filter the favorites array based on the search text
        filteredFavorites = favorites.filter { favorite in
            return favorite.author.lowercased().contains(searchText.lowercased())
        }
        
        // Reload the table view
        tableView.reloadData()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the table view controller as the data source for the table view
        tableView.dataSource = self
        // 1
        searchController.searchResultsUpdater = self
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Search Author"
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Get the encoded favorites array from UserDefaults
           let encodedFavorites = UserDefaults.standard.array(forKey: "favorites") as? [Data] ?? [Data]()
           // Decode the encoded favorites and store them in the favorites array
           let decoder = PropertyListDecoder()
           favorites = encodedFavorites.compactMap { try? decoder.decode(Favorite.self, from: $0) }
        // Reload the table view to display the updated favorites array
       
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //10
        if isFiltering {
                return filteredFavorites.count
            }
            return favorites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath)
        // favorite = filteredFavorites[indexPath.row]
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
        //let selectedFavorite: Favorite
        if searchController.isActive {
            let selectedFavorite = filteredFavorites[indexPath.row]
            performSegue(withIdentifier: "ShowFavorite", sender: selectedFavorite)
        } else {
            let selectedFavorite = favorites[indexPath.row]
            performSegue(withIdentifier: "ShowFavorite", sender: selectedFavorite)
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFavorite" {
            if let destinationVC = segue.destination as? FavoriteViewController {
                        destinationVC.favorite = sender as? Favorite
                        destinationVC.favoritesTableViewController = self
                    }
            }
    }
}

extension FavoritesTableViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
      filterContentForSearchText(searchController.searchBar.text!)
  }
}
