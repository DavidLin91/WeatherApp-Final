//
//  FavoritesVC.swift
//  WeatherApp
//
//  Created by David Lin on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class FavoritesVC: UIViewController {
    
    public var dataPersistence: DataPersistence<Photo>!
    
    
    private var savedArticles = [Photo]() {
        didSet {
            print("there are \(savedArticles.count) articles")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func fetchSavedArticles() {
        do {
            savedArticles = try dataPersistence.loadItems()
        } catch {
            print("error fetching articles")
        }
    }
}


extension FavoritesVC: DataPersistenceDelegate {
    func didSaveItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        print("item was saved")
    }
    
    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        print("item was deleted")
    }
    
    
}
