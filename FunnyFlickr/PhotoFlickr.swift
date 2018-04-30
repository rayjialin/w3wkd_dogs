//
//  photo.swift
//  FunnyFlickr
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import Foundation
import UIKit

class PhotoFlickr: NSObject {
    
        var title: String!
        var imageUrl: String!
        var image: UIImage!
    
    func initWith(title: String, imageUrl: String) {
        
        self.title = title
        self.imageUrl = imageUrl
        self.image = #imageLiteral(resourceName: "empty-folder")
    }

}
