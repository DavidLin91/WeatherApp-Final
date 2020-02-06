//
//  DetailVC.swift
//  WeatherApp
//
//  Created by David Lin on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

private var detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {

    }
    
    
    
    
 
}

extension UIImage {
    func resizeImage(to width: CGFloat, height: CGFloat) -> UIImage {
        let size = CGSize(width: width, height: height)
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
