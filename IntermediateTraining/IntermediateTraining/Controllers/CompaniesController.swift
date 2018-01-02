//
//  ViewController.swift
//  IntermediateTraining
//
//  Created by Uchenna  Aguocha on 12/29/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit
import CoreData

class CompaniesController: UITableViewController, CreateCompanyControllerDelegate {

    let cellId = "cellId" // is the identifier for the tableView.dequeueReusableCell
    var companies = [Company]()
//    var companies = [
//        Company(name: "Apple", founded: Date()),
//        Company(name: "Google", founded: Date()),
//        Company(name: "Airbnb", founded: Date()),
//        Company(name: "SpaceX", founded: Date())
//    ]
    private func fetchCompanies() {
        // attemp my core data fetch somehow
//        let persistentContainer = NSPersistentContainer(name: "IntermediateTrainingModels")
//        persistentContainer.loadPersistentStores { (storeDescription, error) in
//            if let error = error {
//                fatalError("Loading of store failed: \(error)")
//            }
//        }
        
        let context = CoreDataManager.shared.presistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        
        do {
            let companies = try context.fetch(fetchRequest)
            
            companies.forEach({ (company) in
                print(company.name ?? "")
            })
            
            self.companies = companies
            self.tableView.reloadData()
            
        } catch let fetchError {
            print("Failed to fetch error:", fetchError)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        setupTableViewStyle()
        setupNavigationItem()
        fetchCompanies()
    }
    
    func setupTableViewStyle() {
        tableView.backgroundColor = .darkGrayBlue
        // Used separatorStyle to remove the lines that come with the tableView
        //tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
    
    // This func setups the navigation bar item
    func setupNavigationItem() {
        navigationItem.title = "Companies"
        // Adding the plus sign image as the right bar button item
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddCompany))
    }
    
    // Once the plus button is tapped, func handleAppCompany will present the next viewController
    @objc func handleAddCompany() {
        print("Adding company...")
        
        let createCompanyController = CreateCompanyController()
        let navController = CustomNavigationController(rootViewController: createCompanyController)
        
        createCompanyController.delegate = self
        
        present(navController, animated: true, completion: nil)
    }
    
    
    func didAddCompany(company: Company) {
        companies.append(company)
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
}

// TableView Delegate and DataSource Methods
// These methods will configure the cells within the tableView
extension CompaniesController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let company = companies[indexPath.row]
        
        cell.backgroundColor = .tealColor
        cell.textLabel?.text = company.name
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}





