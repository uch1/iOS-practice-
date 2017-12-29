//
//  VideoCell.swift
//  YouTubeClone
//
//  Created by Uchenna  Aguocha on 12/29/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    // Creating UIelement
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        return imageView
    }()
    
    // this is called when the dequequed cell needs a new cell
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {
        addSubview(thumbnailImageView)
        
        thumbnailImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
