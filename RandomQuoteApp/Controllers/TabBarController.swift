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
        vc1.navigationBar.tintColor = UIColor(red: 0.28627450980392155, green: 0.32941176470588235, blue: 0.45098039215686275, alpha: 1)
        vc2.navigationBar.tintColor = UIColor(red: 0.28627450980392155, green: 0.32941176470588235, blue: 0.45098039215686275, alpha: 1)
        vc1.tabBarItem.image = UIImage(systemName: "quote.opening")
        vc1.tabBarItem.title = "Random Quotes"
        vc2.tabBarItem.image = UIImage(systemName: "heart.fill")
        vc2.tabBarItem.title = "Favorites"
        viewControllers = [vc1,vc2]
    }
    
    func setupUI() {
        tabBar.backgroundColor = UIColor(red: 0.87450980392156863, green: 0.9137254901960784, blue: 0.94901960784313721, alpha: 1)
        tabBar.barTintColor = UIColor(red: 0.87450980392156863, green: 0.9137254901960784, blue: 0.94901960784313721, alpha: 1)
        tabBar.insetsLayoutMarginsFromSafeArea = false
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(red: 0.28627450980392155, green: 0.32941176470588235, blue: 0.45098039215686275, alpha: 1)
   }
}
