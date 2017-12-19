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
        imageView.contentMode = .scaleAspectFit
        // this enables autolayout for our imageview
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributeText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        attributeText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        textView.attributedText = attributeText
//        textView.text = "Join us today in our fun and games!"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // make sure to apple the correct encapsulation principles in your classes
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.addSubview(thumbImageView)
        view.addSubview(descriptionTextView)
        
        setupBottomControls()
        setupAutoLayout()
    }

    fileprivate func setupBottomControls() {
        view.addSubview(previousButton)
        previousButton.backgroundColor = .red
     //   previousButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        NSLayoutConstraint.activate([
//                previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                previousButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                previousButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func setupAutoLayout() {
        // positioning an ImageView based on the
        // dimensions of the view controller
        let topImageContainerView = UIView()
       // topImageContainerView.backgroundColor = .blue
        view.addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topImageContainerView.addSubview(thumbImageView)
        thumbImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        thumbImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        thumbImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true

//        thumbImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        thumbImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        thumbImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        thumbImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    
    
    
    
}

