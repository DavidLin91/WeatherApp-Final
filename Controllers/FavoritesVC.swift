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
    @IBOutlet weak var collectionView: UICollectionView!
    
    public var dataPersistence: DataPersistence<Photo>!
    
    
    private var favoritedPics = [Photo]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        fetchSavedArticles()
    }
    
    
    private func fetchSavedArticles() {
        do {
            favoritedPics = try dataPersistence.loadItems()
        } catch {
            print("error fetching articles")
        }
    }
}


extension FavoritesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favoritedPics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as? FavoriteCell else {
            fatalError()
        }
        let favorite = favoritedPics[indexPath.row]
        cell.congigureCell(for: favorite)
        return cell
    }
}


extension FavoritesVC: UICollectionViewDelegateFlowLayout {
    
}



extension FavoritesVC: Delegate {
    func didAddToFaves(photo: Photo) {
        favoritedPics.append(photo)
    }
}
