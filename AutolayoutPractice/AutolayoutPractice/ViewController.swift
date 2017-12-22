//
//  ViewController.swift
//  AutolayoutPractice
//
//  Created by Uchenna  Aguocha on 12/18/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//  Credit given to Brian Voong "Lets build that App" for the autolayout tutorial

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 233/255, green: 68/255, blue: 133/255, alpha: 1)
}

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
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // make sure to apply the correct encapsulation principles in your classes
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.mainPink, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.addSubview(thumbImageView)
        view.addSubview(descriptionTextView)
        
        setupBottomControls()
        setupAutoLayout()
    }

    fileprivate func setupBottomControls() {
//        view.addSubview(previousButton)
//        previousButton.backgroundColor = .red
//        previousButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        
//        let yellowView = UIView()
//        yellowView.backgroundColor = .yellow
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        
//        let blueView = UIView()
//        blueView.backgroundColor = .blue
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
//                previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func setupAutoLayout() {
        // positioning an ImageView based on the
        // dimensions of the view controller
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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

