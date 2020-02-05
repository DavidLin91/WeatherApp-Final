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
    
    public lazy var zipcodeTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray4
        textField.textAlignment = .center
        textField.keyboardType = .numbersAndPunctuation
        textField.placeholder = "zip code"
        return textField
    }()
    
    private lazy var enterZipCodeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Enter zip code"
        return label
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
        setupTextFieldConstraints()
        setupZipCodeLabel()
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
        addSubview(zipcodeTextField)
        
        zipcodeTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            zipcodeTextField.topAnchor.constraint(equalTo: weatherCollectionView.bottomAnchor, constant: 20),
            zipcodeTextField.leadingAnchor.constraint(equalTo:leadingAnchor, constant: 150),
            zipcodeTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150)
        ])
    }
    
    private func setupZipCodeLabel() {
        addSubview(enterZipCodeLabel)
        
        enterZipCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterZipCodeLabel.topAnchor.constraint(equalTo: zipcodeTextField.bottomAnchor, constant: 10),
            enterZipCodeLabel.leadingAnchor.constraint(equalTo:leadingAnchor, constant: 150),
            enterZipCodeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150)
        ])
    }
    
    
}
