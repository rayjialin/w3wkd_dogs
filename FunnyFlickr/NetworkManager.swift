//
//  NetworkManager.swift
//  FunnyFlickr
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager: NSObject {
    
    
    
    func makeNetworkRequest(urlStr:String, completion: @escaping (NSArray) -> ()){
        
        guard let url = URL(string: urlStr) else { return }
        
        let urlRequest = URLRequest(url: url)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            guard error == nil else{
                print("error")
                return
            }
            
            guard let content = data else{
                print("no content")
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String : Any] else {
                print("no json content")
                return
            }
            
            guard let jsonDict = json["photos"] as? [String:Any] else {return}
            
            guard let jsonArray = jsonDict["photo"] as? NSArray else {return}
            
            completion(jsonArray)
        }
        task.resume()
    }
    
    
    func getImage(imageString:String, completion: @escaping (UIImage) -> ()){
        guard let url = URL(string: imageString) else {return}
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let downloadTask = session.downloadTask(with: url) { (imageUrl, response, error) in
            
            guard error == nil else{
                print("error")
                return
            }
            
            do {
                let imageData = try Data.init(contentsOf: imageUrl!)
                let image: UIImage = UIImage(data: imageData)!
                completion(image)
            }catch{
                print("image download failed")
            }
            
        }
        downloadTask.resume()
    }
}
