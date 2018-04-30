//
//  photo.swift
//  FunnyFlickr
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import Foundation

class Photo: NSObject {
    let : menuModelEnum
    let imageName: String
    
    init(labelName: menuModelEnum, imageName: String) {
        self.labelName = labelName
        self.imageName = imageName
    }
}
