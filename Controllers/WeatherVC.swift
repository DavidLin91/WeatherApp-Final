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
    }


}
