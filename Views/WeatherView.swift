//
//  WeatherView.swift
//  WeatherApp
//
//  Created by David Lin on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherView: UIView {

    private lazy var weatherCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.backgroundColor = .systemGray4
        return collectionView
    }()
    
    private lazy var cityLabelTitle: UILabel = {
        let cityLabel = UILabel()
        cityLabel.textAlignment = .center
        cityLabel.text = "Weather Forecast For City Name"
        return cityLabel
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commonInit()
    }
    
    
    private func commonInit() {
        setupCityLabelConstraints()
        setupCollectionViewConstraints()
    }
    
    
    private func setupCityLabelConstraints() {
        addSubview(cityLabelTitle)
        cityLabelTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLabelTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            cityLabelTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cityLabelTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    
    private func setupCollectionViewConstraints() {
        addSubview(weatherCollectionView)
        weatherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherCollectionView.topAnchor.constraint(equalTo: cityLabelTitle.bottomAnchor, constant: 20),
            weatherCollectionView.leadingAnchor.constraint(equalTo: cityLabelTitle.leadingAnchor, constant: 20),
        weatherCollectionView.trailingAnchor.constraint(equalTo: cityLabelTitle.trailingAnchor, constant: 20)
        
        ])
    }
    
    
    
    
    
    
}
