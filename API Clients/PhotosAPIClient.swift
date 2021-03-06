//
//  PhotosAPIClient.swift
//  WeatherApp
//
//  Created by David Lin on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

struct PhotosAPIClient {
    static func getPhotos(for search: String, completion: @escaping(Result<[Photo], AppError>) -> ()) {
        
        let searchQuery = search.lowercased().addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let endpointURL = "https://pixabay.com/api/?key=\(Secrets.pixaBayKey)&q=\(searchQuery ?? "")"
        
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let results = try JSONDecoder().decode(PhotoSearch.self, from: data)
                    completion(.success(results.hits))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
