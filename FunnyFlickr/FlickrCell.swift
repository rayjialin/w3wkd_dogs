//
//  FlickrCell.swift
//  FunnyFlickr
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import Foundation
import UIKit

class FlickrCell: UICollectionViewCell {
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    let cellTitle: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .red
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
        self .addSubview(cellImageView)
        self.addSubview(cellTitle)
        setupView()
    }
    
    func setupView(){
        cellImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        cellImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        cellImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cellImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        cellTitle.topAnchor.constraint(equalTo: self.cellImageView.bottomAnchor, constant: 10).isActive = true
        cellTitle.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        cellTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true

        
    }
    
    
}
