//
//  ViewController.swift
//  AutolayoutPractice
//
//  Created by Uchenna  Aguocha on 12/18/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//  Credit given to Brian Voong "Lets build that App" for the autolayout tutorial

import UIKit

class ViewController: UIViewController {

    // lets avoid polluting viewDidLoad
    // {} is referred to as closure, or anon. function
    let thumbImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "thumbs-up-icon-blue-hi"))
        // this enables autolayout for our imageview
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Join us today in our fun and games!"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(thumbImageView)
        view.addSubview(descriptionTextView)
        
        setupAutoLayout()
    }

    private func setupAutoLayout() {
        // positioning an ImageView based on the
        // dimensions of the view controller
        
        thumbImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thumbImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        thumbImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        thumbImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: thumbImageView.bottomAnchor, constant: 150).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    
    
    
    
}

