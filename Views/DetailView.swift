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
    public lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    public lazy var cityImage: UIImageView = {
        let cityImage = UIImageView()
        return cityImage
    }()
    
    public lazy var highTempLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    public lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
        
    }()
    
    
    public lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    public lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    public lazy var windSpeed: UILabel = {
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
        configureCityImage()
        configureHighTemp()
        configureLowTemp()
        configureSunriseLabel()
        configureSunsetLabel()
    }
    
    private func configureWeatherLabel() {
        addSubview(weatherLabel)
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            weatherLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            weatherLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    
    private func configureCityImage() {
        addSubview(cityImage)
        cityImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityImage.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 30),
            cityImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cityImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            cityImage.heightAnchor.constraint(equalToConstant: 400.0)
        
        
        ])
    }
    
    
    private func configureHighTemp() {
           addSubview(highTempLabel)
           highTempLabel.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               highTempLabel.topAnchor.constraint(equalTo: cityImage.bottomAnchor, constant: 30),
               highTempLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
               highTempLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
           ])
       }
    
    private func configureLowTemp() {
        addSubview(lowTempLabel)
        lowTempLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowTempLabel.topAnchor.constraint(equalTo: highTempLabel.bottomAnchor, constant: 10),
            lowTempLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            lowTempLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func configureSunriseLabel() {
        addSubview(sunriseLabel)
        sunriseLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sunriseLabel.topAnchor.constraint(equalTo: lowTempLabel.bottomAnchor, constant: 10),
            sunriseLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            sunriseLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func configureSunsetLabel() {
        addSubview(sunsetLabel)
        sunsetLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sunsetLabel.topAnchor.constraint(equalTo: sunriseLabel.bottomAnchor, constant: 10),
            sunsetLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            sunsetLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func configureWindSpeed() {
           addSubview(windSpeed)
           windSpeed.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               windSpeed.topAnchor.constraint(equalTo: sunsetLabel.bottomAnchor, constant: 10),
               windSpeed.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
               windSpeed.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
           ])
       }
    
    
}
