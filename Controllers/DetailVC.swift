//
//  DetailVC.swift
//  WeatherApp
//
//  Created by David Lin on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit
import DataPersistence

class DetailVC: UIViewController {

private var detailView = DetailView()
    var picture: Photo?
        
    public var dataPersistence: DataPersistence<Photo>!
    
    var weather: DailyForcast? 
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(favoriteButtonPressed(_:)))
    }
    
    public func updateUI() {
        detailView.weatherLabel.text = weather?.summary
        detailView.highTempLabel.text = "High Temp: \(weather?.temperatureHigh.description ?? "")"
        detailView.lowTempLabel.text = "Low Temp: \(weather?.temperatureLow.description ?? "")"
        detailView.sunriseLabel.text = "Sunrise: \(weather?.sunriseTime.description ?? "this")"
        detailView.sunsetLabel.text = "Sunset: \(weather?.sunsetTime.description ?? "" )"
        detailView.windSpeed.text = "Wind Speed: \(weather?.windSpeed.description ?? "")"
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
    
    @objc func favoriteButtonPressed(_ sender: UIBarButtonItem){
           guard let picture = picture else { return }
           do {
               // saves to document directory
               try dataPersistence.createItem(picture)
           } catch {
               print("error saving article \(error)")
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
