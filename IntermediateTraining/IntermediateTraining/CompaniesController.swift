//
//  ViewController.swift
//  IntermediateTraining
//
//  Created by Uchenna  Aguocha on 12/29/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class CompaniesController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationItem()
        setupNavigationStyle()
    }
    
    // This setups the navigation bar item
    func setupNavigationItem() {
        navigationItem.title = "Companies"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddCompany))
    }
    
    @objc func handleAddCompany() {
        print("Adding company...")
    }
    
    // This setups the navigation bar style
    func setupNavigationStyle() {
        
        let lightRed = UIColor(red: 247/255, green: 66/255, blue: 82/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = lightRed
        // Disable the navbar's translucency 
        navigationController?.navigationBar.isTranslucent = false
        // Making the font bold
        navigationController?.navigationBar.prefersLargeTitles = true
        // Setting the color of the font to white
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}

