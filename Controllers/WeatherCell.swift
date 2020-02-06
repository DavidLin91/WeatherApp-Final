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
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var weatherImage: UIImageView = {
        let weatherImage = UIImageView()
        weatherImage.contentMode = .scaleAspectFit
        return weatherImage
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
    }
    
    
    public func updateUI(data: DailyForcast) {
        dateLabel.text = data.time.convertDate()
        weatherImage.image = UIImage(named: data.icon)
    }
    



    private func setupDateLabelConstraints() {
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
    public func setupImageConstraints() {
        addSubview(weatherImage)
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherImage.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5)
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
