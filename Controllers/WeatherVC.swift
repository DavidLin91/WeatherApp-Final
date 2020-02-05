//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by David Lin on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    private let weatherView = WeatherView()
    
    private var weeklyForcast = [DailyForcast]() {
        didSet {
            DispatchQueue.main.async {
                self.weatherView.weatherCollectionView.reloadData()
            }
        }
    }
    

    override func loadView() {
        view = weatherView
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        guard let zipCode = UserDefaults.standard.object(forKey: "zipCode") as? String else {
            return
        }
    }
    

}

extension WeatherVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weeklyForcast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = weatherView.weatherCollectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as WeatherCell? else {
                fatalError("Could not dequeue WeatherCell")
        }
    }
    
    
}

extension WeatherVC: UICollectionViewDelegateFlowLayout {
    
}

extension WeatherVC: UITextFieldDelegate {
    
}
