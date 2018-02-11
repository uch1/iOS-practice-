//
//  ViewController.swift
//  IntermediateTraining
//
//  Created by Uchenna  Aguocha on 12/29/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit
import CoreData

class CompaniesController: UITableViewController {
    
    // MARK:- Properties
    let cellId = "cellId" // is the identifier for the tableView.dequeueReusableCell
    var companies = [Company]()

    // MARK:- Methods
//    private func fetchCompanies() {
//
//        let context = CoreDataManager.shared.presistentContainer.viewContext
//
//        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
//
//        do {
//            let companies = try context.fetch(fetchRequest)
//
////            companies.forEach({ (company) in
////                print(company.name ?? "")
////            })
//
//            self.companies = companies
//            self.tableView.reloadData()
//
//        } catch let fetchError {
//            print("Failed to fetch error:", fetchError)
//        }
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.companies = CoreDataManager.shared.fetchCompanies()
        tableView.register(CompanyCell.self, forCellReuseIdentifier: cellId)
        setupTableViewStyle()
        setupNavigationItem()
        setupPlusButtonInNavBar(selector: #selector(handleAddCompany))
        
    }
    
    private func setupTableViewStyle() {
        tableView.backgroundColor = .darkGrayBlue
        // Used separatorStyle to remove the lines that come with the tableView
        //tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
    
    // This func setups the navigation bar item
    private func setupNavigationItem() {
        navigationItem.title = "Companies"
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(handleReset)),
            UIBarButtonItem(title: "Do Updates", style: .plain, target: self, action: #selector(doUpdates))
        ]
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(handleReset))
        // Adding the plus sign image as the right bar button item
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddCompany))
    }
    
    @objc private func doUpdates() {
        print("Trying to update companies on a background context")
        
        CoreDataManager.shared.persistentContainer.performBackgroundTask { (backgroundContext) in
            
            let request: NSFetchRequest<Company> = Company.fetchRequest()
            
            do {
                let companies = try backgroundContext.fetch(request)
                
                companies.forEach({ (company) in
                    print(company.name ?? "")
                    company.name = "C: \(company.name ?? "")"
                })

                do {
                    try backgroundContext.save()
                    
                    // let's try to update the UI after a save
                    DispatchQueue.main.async {
                        
                        // reset will forget all of the objects you've fetch before
                        CoreDataManager.shared.persistentContainer.viewContext.reset()
                        
                        // you don't want to refetch everything if your're just simply updating one or two companies
                        self.companies = CoreDataManager.shared.fetchCompanies()
                        
                        // is there a way to just merger the changes that you made onto the main view context? YASSSS!!!!   
                        self.tableView.reloadData()
                    }
                    
                } catch let saveError {
                    print("Failed to save on background:", saveError)
                }
                
            } catch let error {
                print("Failed to fetch companies on background:", error)
            }
            
        }
    }
    
    @objc private func doWork() {
        
        print("Trying to do work...")
        
        CoreDataManager.shared.persistentContainer.performBackgroundTask { (backgroundContext) in
            
            (0...5).forEach { (value) in
                print(value)
                let company = Company(context: backgroundContext)
                company.name = String(value)
                
            }
            
            do {
                try backgroundContext.save()
                
                DispatchQueue.main.async {
                    self.companies = CoreDataManager.shared.fetchCompanies()
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print("Failed to save:", error)
            }
            
            
        }
        
        
        // GCD - Grand Central Dispatch
//        DispatchQueue.global(qos: .background).async {
//
//            let context = CoreDataManager.shared.persistentContainer.viewContext
//
//
//
//        }

    }
    
    @objc private func handleReset() {
        print("Attempting to delete all core data objects")
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
//        companies.forEach { (company) in
//            context.delete(company)
//        }
        
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Company.fetchRequest())
        
        do {
            try context.execute(batchDeleteRequest)
            
            // upon deletion from core data succeeded
            var indexPathsToRemove = [IndexPath]()
            
            for (index, _) in companies.enumerated() {
                let indexPath = IndexPath(row: index, section: 0)
                indexPathsToRemove.append(indexPath)
            }
            
            companies.removeAll()
            tableView.deleteRows(at: indexPathsToRemove, with: .left)
            
//            companies.forEach({ (company) in
//                companies.index(after: <#T##Int#>)
//                // But this loop doesn't provide us with the row number
//            })
            
//            companies.removeAll()
//            tableView.reloadData()
            
        } catch let deletedError {
            print("Failed to delete objects from core data:", deletedError)
        }
        
    }
    
    // Once the plus button is tapped, func handleAppCompany will present the next viewController
    @objc private func handleAddCompany() {
        print("Adding company...")
        let createCompanyController = CreateCompanyController()
        let navController = CustomNavigationController(rootViewController: createCompanyController)
        
        createCompanyController.delegate = self
        
        present(navController, animated: true, completion: nil)
    }
    
}






