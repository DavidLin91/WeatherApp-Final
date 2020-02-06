//
//  DetailVC.swift
//  WeatherApp
//
//  Created by David Lin on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit

class DetailVC: UIViewController {

private var detailView = DetailView()
    var picture: Photo?
    var weather: DailyForcast? 
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        view.backgroundColor = .white
    }
    
    public func updateUI() {
        detailView.weatherLabel.text = weather?.summary
        detailView.cityImage.getImage(with: picture?.largeImageURL ?? "") { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let image):
                DispatchQueue.main.async {
                    self.detailView.cityImage.image = image
                }
            }
        }
    }
    
    
    
    
 
}

extension UIImage {
    func resizeImage(to width: CGFloat, height: CGFloat) -> UIImage {
        let size = CGSize(width: width, height: height)
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
