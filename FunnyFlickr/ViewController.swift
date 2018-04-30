//
//  ViewController.swift
//  FunnyFlickr
//
//  Created by ruijia lin on 4/28/18.
//  Copyright © 2018 ruijia lin. All rights reserved.

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    let array = [#imageLiteral(resourceName: "corgi0"),#imageLiteral(resourceName: "corgi1"),#imageLiteral(resourceName: "corgi2"),#imageLiteral(resourceName: "corgi3"),#imageLiteral(resourceName: "corgi4"),#imageLiteral(resourceName: "corgi5"),#imageLiteral(resourceName: "corgi6"),#imageLiteral(resourceName: "corgi7"),#imageLiteral(resourceName: "corgi8"),#imageLiteral(resourceName: "corgi9")]
    var flickrArray = [PhotoFlickr]()
    //    let flickr = PhotoFlickr()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.navigationItem.title = "Funny Flickr"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let networkManager = NetworkManager()
        networkManager.makeNetworkRequest(urlStr: "https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=2da5c79660e494bf3778ed6caa21696f&tags=funny_pics") { (jsonArray) in
            
            for item in jsonArray {
                if let currentDict = item as? Dictionary<String,AnyObject>{
                    let farm =  currentDict["farm"] as! Int
                    let server = currentDict["server"] as! String
                    let id = currentDict["id"] as! String
                    let secret = currentDict["secret"] as! String
                    let imageUrl = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
                    let flickr = PhotoFlickr()
                    flickr.initWith(title: currentDict["title"] as! String, imageUrl: imageUrl)
                    self.flickrArray.append(flickr)
                }
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.flickrArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! FlickrCell
        //        cell.cellImageView.image = array[indexPath.row]
        let flickr = self.flickrArray[indexPath.row]
        if flickr.image == #imageLiteral(resourceName: "empty-folder") {
            let networkManager = NetworkManager()
            networkManager.getImage(imageString: flickr.imageUrl) { (image) in
                DispatchQueue.main.async {
                    flickr.image = image
                    self.collectionView.reloadData()
                }
            }
        }
        cell.cellImageView.image = flickr.image
        cell.cellTitle.text = flickr.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width / 4 , height: self.view.frame.size.width / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10,	10, 10, 10)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "detailId", sender: self.flickrArray[indexPath.row])
        let flickr = self.flickrArray[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.cellImageView.image = flickr.image
        detailVC.cellTitle.text = flickr.title
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "detailId"{
//            let flickr = sender as! PhotoFlickr
//            let detailVC = segue.destination as! DetailViewController
//
//            detailVC.photoTitle = flickr.title
//            detailVC.photo = flickr.image
//        }
//
//    }
}

