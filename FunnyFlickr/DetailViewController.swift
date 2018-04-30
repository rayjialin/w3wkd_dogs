//
//  DetailViewController.swift
//  FunnyFlickr
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let cellTitle: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
        self.view.addSubview(cellImageView)
        self.view.addSubview(cellTitle)
        
        setupView()
        
        
    }
    
    func setupView(){
        
        let layoutGuide = self.view.safeAreaLayoutGuide
        cellImageView.widthAnchor.constraint(equalTo: layoutGuide.widthAnchor).isActive = true
        cellImageView.heightAnchor.constraint(equalTo: layoutGuide.heightAnchor, multiplier: 0.8).isActive = true
        cellImageView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        cellImageView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        
        cellTitle.topAnchor.constraint(equalTo: self.cellImageView.bottomAnchor, constant: 10).isActive = true
        cellTitle.widthAnchor.constraint(equalTo: layoutGuide.widthAnchor).isActive = true
        cellTitle.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -10).isActive = true
    }
}
