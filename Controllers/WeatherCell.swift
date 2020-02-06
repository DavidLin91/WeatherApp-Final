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
    }
    
    
    public func updateUI(data: DailyForcast) {
        dateLabel.text = String(data.time)
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
}
