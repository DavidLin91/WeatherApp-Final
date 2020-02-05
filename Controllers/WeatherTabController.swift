//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Rifkin on 10/8/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class WeatherTabController: UITabBarController {
    
    private lazy var weatherVC: WeatherVC = {
        let viewcontroller = WeatherVC()
        viewcontroller.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "cloud"), tag: 0)
        return viewcontroller
    }()
    
    private lazy var favoritesVC: FavoritesVC = {
        let favoritesStoryboard = UIStoryboard(name: "Favorites", bundle: nil)
        guard let viewcontroller = favoritesStoryboard.instantiateViewController(identifier: "FavoritesVC") as? FavoritesVC else {
            fatalError("could not load FavoritesVC")
        }
        viewcontroller.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 1)
        return viewcontroller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [weatherVC, favoritesVC]
    }
    
}

