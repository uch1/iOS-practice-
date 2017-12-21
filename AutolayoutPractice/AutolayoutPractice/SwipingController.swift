//
//  SwipingController.swift
//  AutolayoutPractice
//
//  Created by Uchenna  Aguocha on 12/19/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

struct Page {
    let imageName: String
    let headerText: String
}

class SwipingController: UICollectionViewController {
    
    var pages = [
        Page(imageName: "thumbs-up-icon-blue-hi", headerText: "Join us today in our fun and games!"),
        Page(imageName: "aom-kickstarter-funded", headerText: "Subscribe and get coupons on our daily events"),
        Page(imageName: "left-arrow", headerText: "VIP members special services")
    ]
    
//    var imageNames = ["thumbs-up-icon-blue-hi", "aom-kickstarter-funded", "left-arrow"]
//    var headerStrings = ["Join us today in our fun and games!", "Subscribe and get coupons on our daily events", "VIP members special services"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.thumbImageView.image = UIImage(named: page.imageName)
        cell.descriptionTextView.text = page.headerText
        
//        let imageName = imageNames[indexPath.item]
//        cell.thumbImageView.image = UIImage(named: imageName)
//        cell.descriptionTextView.text = headerStrings[indexPath.item]
        //cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    
}

extension SwipingController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}








