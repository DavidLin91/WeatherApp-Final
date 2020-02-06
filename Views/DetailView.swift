//
//  DetailView.swift
//  WeatherApp
//
//  Created by David Lin on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    //Fields
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var cityImage: UIImageView = {
        let cityImage = UIImageView()
        return cityImage
    }()
    
    private lazy var highTempLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
        
    }()
    
    
    private lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var windSpeed: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
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
        configureWeatherLabel()
    }
    
    private func configureWeatherLabel() {
        addSubview(weatherLabel)
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            weatherLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            weatherLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    
    
    
    
    
}
