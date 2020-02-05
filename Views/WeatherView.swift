//
//  WeatherView.swift
//  WeatherApp
//
//  Created by David Lin on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    
    
    //Fields
    
    public lazy var weatherCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray2
        return collectionView
    }()
    
    public lazy var cityLabelTitle: UILabel = {
        let cityLabel = UILabel()
        cityLabel.textAlignment = .center
        cityLabel.text = "Weather Forecast For City Name"
        return cityLabel
    }()
    
    
    public lazy var summary: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    public var zipcodeTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.placeholder = "zip code"
        return textField
    }()
    
    
    //INIT
    
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
    
   
    
    
    //CONSTRAINTS
    
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
            weatherCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherCollectionView.heightAnchor.constraint(equalToConstant: 275)
            
        ])
    }
    
    private func setupTextFieldConstraints() {
        
    }()
    
    
    
    
}
