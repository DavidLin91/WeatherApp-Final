//
//  FavoriteCell.swift
//  WeatherApp
//
//  Created by David Lin on 4/30/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
     
    public func congigureCell(for favorite: Photo) {
        cellImage.getImage(with: favorite.largeImageURL ) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.cellImage.image = UIImage(systemName: "heart.circle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.cellImage.image = image
                }
            }
        }
    }
    
    
}
