//
//  CreateCompanyController.swift
//  IntermediateTraining
//
//  Created by Uchenna  Aguocha on 12/30/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class CreateCompanyController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGrayBlue
        setupNavigationItem()
    }
    
    func setupNavigationItem() {
        navigationItem.title = "Create Company"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
    }
    
    @objc func handleCancel() {
        print("Cancel pressed..")
    }
    
}
