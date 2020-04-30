//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by David Lin on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class WeatherVC: UIViewController {
    
    private let weatherView = WeatherView()
    public var cityImages = [Photo]()
    
    public var dataPersistence: DataPersistence<Photo>!
    
    
    private var weeklyForcast = [DailyForecast]() {
        didSet {
            DispatchQueue.main.async {
                self.weatherView.weatherCollectionView.reloadData()
            }
        }
    }
    
    
    private var zipCode = String() {
        didSet {
            getWeatherFromZipCode(zipcode: zipCode)
            
        }
    }
    
    override func loadView() {
        view = weatherView
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        weatherView.weatherCollectionView.dataSource = self
        weatherView.weatherCollectionView.delegate = self
        weatherView.zipcodeTextField.delegate = self
        getWeatherFromZipCode(zipcode: zipCode)
        weatherView.weatherCollectionView.register(WeatherCell.self, forCellWithReuseIdentifier: "WeatherCell")
    }
    
    
    public func getWeatherFromZipCode(zipcode: String) {
        ZipCodeHelper.getLatLong(fromZipCode: zipCode) {  [weak self] (results) in
            switch results {
            case .success(let location):
                let lat = location.lat
                let long = location.long
                self?.getWeather(lat: lat, long: long)
                DispatchQueue.main.async {
                    self?.getPhotos(photo: location.placeName)
                    self?.weatherView.cityLabelTitle.text = location.placeName
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    public func getWeather(lat: Double, long: Double) {
        WeatherAPIClient.getWeather(lat: lat, long: long) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("getWeather error: \(appError)")
            case .success(let dailyForecast):
                self?.weeklyForcast = dailyForecast.daily.data
                DispatchQueue.main.async {
                    self?.weatherView.summary.text = dailyForecast.daily.summary
                }
            }
        }
    }
    
    
    private func getPhotos(photo: String) {
        PhotosAPIClient.getPhotos(for: photo) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print(" error: \(appError)")
            case .success(let photos):
                self?.cityImages = photos
            }
        }
        
    }
}

extension WeatherVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weeklyForcast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = weatherView.weatherCollectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else {
            fatalError("Could not dequeue WeatherCell")
        }
        let weather = weeklyForcast[indexPath.row]
        cell.backgroundColor = .white
        cell.updateUI(data: weather)
        return cell
    }
}


extension WeatherVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSpacing: CGFloat = 10
        let maxWidth = UIScreen.main.bounds.size.width
        let numberOfItems: CGFloat = 2
        let totalSpacing: CGFloat = numberOfItems * itemSpacing
        let itemWidth: CGFloat = (maxWidth - totalSpacing)/numberOfItems
        return CGSize(width: itemWidth, height: itemWidth * 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weatherDay = weeklyForcast[indexPath.row]
        let dvc = DetailVC()
        dvc.picture = cityImages[indexPath.row]
        dvc.weather = weatherDay
        
        dvc.dataPersistence = dataPersistence
        
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    
}


extension WeatherVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        zipCode = textField.text ?? ""
        textField.resignFirstResponder()
        return true
    }
}
