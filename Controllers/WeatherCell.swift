//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by David Lin on 2/5/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.thin)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var weatherImage: UIImageView = {
        let weatherImage = UIImageView()
        weatherImage.contentMode = .scaleAspectFit
        return weatherImage
    }()
    
    
    private lazy var highTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.thin)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.thin)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupDateLabelConstraints()
        setupImageConstraints()
        setupHighTempLabelConstraint()
        setupLowTempLabelConstraint()
    }
    
    
    public func updateUI(data: DailyForecast) {
        dateLabel.text = data.time.convertDate()
        weatherImage.image = UIImage(named: data.icon)
        highTempLabel.text = "High Temp: \(data.temperatureHigh.description)"
        lowTempLabel.text = "High Temp: \(data.temperatureLow.description)"
    }
    
    
    
    
    private func setupDateLabelConstraints() {
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
    public func setupImageConstraints() {
        addSubview(weatherImage)
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherImage.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            weatherImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            weatherImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    public func setupHighTempLabelConstraint() {
        addSubview(highTempLabel)
        highTempLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highTempLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 20),
            highTempLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            highTempLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    
    public func setupLowTempLabelConstraint() {
        addSubview(lowTempLabel)
        lowTempLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowTempLabel.topAnchor.constraint(equalTo: highTempLabel.bottomAnchor, constant: 10),
            lowTempLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lowTempLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
}

extension Double {
    func convertDate() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    func convertTime() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
