//
//  CreateCompanyController.swift
//  IntermediateTraining
//
//  Created by Uchenna  Aguocha on 12/30/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit
import CoreData

// Custom Delegation
protocol CreateCompanyControllerDelegate {
    func didAddCompany(company: Company)
    func didEditCompany(company: Company)
}

class CreateCompanyController: UIViewController {
    
    var company: Company? {
        didSet {
            nameTextField.text = company?.name
        }
    }
    
    // not tightly-coupled 
    var delegate: CreateCompanyControllerDelegate?
    
    let lightBlueBackgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.lightBlue
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // ternary snytax

        navigationItem.title = company == nil ? "Create Company" : "Edit Company"
//        if company == nil {
//            navigationItem.title = "Create Company"
//        } else {
//            navigationItem.title = "Edit Company"
//        }
        // same as the code above
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGrayBlue
        setupNavigationItem()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(lightBlueBackgroundView)
        lightBlueBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lightBlueBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lightBlueBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lightBlueBackgroundView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    }
    
    func setupNavigationItem() {
        navigationItem.title = "Create Company"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
    }
    
    @objc private func handleSave() {
        if company == nil {
            createCompany()
        } else {
            saveCompanyChanges()
        }
    }
    
    private func saveCompanyChanges() {
        let context = CoreDataManager.shared.presistentContainer.viewContext

        company?.name = nameTextField.text
        
        do {
            try context.save()
            // save succeeded 
            dismiss(animated: true, completion: {
                self.delegate?.didEditCompany(company: self.company!)
            })
            
        } catch let saveError {
            print("Failed to save changes:", saveError)
        }
        
    }
    
    private func createCompany() {
        print("Save company..")
        
        let context = CoreDataManager.shared.presistentContainer.viewContext
        
        let company = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context)
        
        company.setValue(nameTextField.text, forKey: "name")
        
        // perform the save
        do {
            try context.save()
            
            // success
            dismiss(animated: true, completion: {
                self.delegate?.didAddCompany(company: company as! Company)
            })
            
        } catch let saveError {
            print("Failed to save company:", saveError)
        }
    }
    
    @objc private func handleCancel() {
        print("Cancel pressed..")
        dismiss(animated: true, completion: nil)
    }
    
}
