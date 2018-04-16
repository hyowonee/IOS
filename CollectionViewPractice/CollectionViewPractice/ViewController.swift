//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by Hyowon Choi on 2018. 2. 15..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    var imageCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageCache.default.clearMemoryCache()
        ImageCache.default.clearDiskCache()
        ImageCache.default.cleanExpiredDiskCache()
    }
    
    @IBAction func add() {
//        collectionView.insertItems(at: [IndexPath.init(item: self.imageCount, section: 0)])
        self.imageCount += 1
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        imageCell.imageView.kf.setImage(with: URL(string: "http://via.placeholder.com/100x100"), options: [.transition(.fade(0.5))])
        return imageCell
    }
}
