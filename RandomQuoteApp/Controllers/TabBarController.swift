//
//  TabBarController.swift
//  RandomQuoteApp
//
//  Created by Whitney Harper on 1/6/23.
//

import UIKit

class TabBarController: UITabBarController{
    
    override func viewDidLoad() {
        setupUI()
        let vc1 = UINavigationController(rootViewController: RandomQuoteViewController())
        let vc2 = UINavigationController(rootViewController: FavoritesTableViewController())
        vc1.navigationBar.tintColor = (UIColor(white: 0, alpha: 1))
        vc2.navigationBar.tintColor = (UIColor(white: 0, alpha: 1))
        vc1.tabBarItem.image = UIImage(systemName: "quote.opening")
        vc1.tabBarItem.title = "Random Quotes"
        vc2.tabBarItem.image = UIImage(systemName: "heart.fill")
        vc2.tabBarItem.title = "Favorites"
        viewControllers = [vc1,vc2]
    }
    
    func setupUI() {
      tabBar.backgroundColor = UIColor(red: 0.85098039215686272, green: 0.85098039215686272, blue: 0.85098039215686272, alpha: 1)
      tabBar.barTintColor = UIColor(red: 0.85098039215686272, green: 0.85098039215686272, blue: 0.85098039215686272, alpha: 1)
      tabBar.insetsLayoutMarginsFromSafeArea = false
      tabBar.isTranslucent = false
      tabBar.tintColor = UIColor(white: 0, alpha: 1)
   }
}
