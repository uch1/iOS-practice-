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
    
    // MARK:- Properties
    let cellId = "cellId" // is the identifier for the tableView.dequeueReusableCell
    var companies = [Company]()

    // MARK:- Methods
    private func fetchCompanies() {
        
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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        setupTableViewStyle()
        setupNavigationItem()
        fetchCompanies()
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(handleReset))
        // Adding the plus sign image as the right bar button item
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddCompany))
    }
    
    @objc private func handleReset() {
        print("Attempting to delete all core data objects")
        
        let context = CoreDataManager.shared.presistentContainer.viewContext
        
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
    
    // MARK:- Protocol/Delegation Methods
    func didAddCompany(company: Company) {
        companies.append(company)
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    func didEditCompany(company: Company) {
        // update my tableview somehow
        guard let row = companies.index(of: company) else { return }
        //let row = companies.index(of: company)
        let reloadIndexPath = IndexPath(row: row, section: 0)
        tableView.reloadRows(at: [reloadIndexPath], with: .middle)
    }

}

// MARK:- TableView Methods
// These methods will configure the cells within the tableView
extension CompaniesController {
    
    // MARK:- Methods for the tableView cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let company = companies[indexPath.row]
        
        cell.backgroundColor = .tealColor
        
        if let name = company.name, let founded = company.founded {
            // MMM dd yyyy
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            
            let foundedDateString = dateFormatter.string(from: founded)
            
            // let locale = Locale(identifier: "EN")
            let dateString = "\(name) - Founded: \(foundedDateString)"
            
            cell.textLabel?.text = dateString
        } else {
            cell.textLabel?.text = company.name
        }
        
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        cell.imageView?.image = #imageLiteral(resourceName: "select_photo_empty")
        
        if let imageData = company.imageData {
            cell.imageView?.image = UIImage(data: imageData)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, indexPath) in
            let company = self.companies[indexPath.row]
            print("Attempting to delete company:", company.name ?? "")
            
            // remove the company from our tableview
            self.companies.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // delete the company from Core Data
            let context = CoreDataManager.shared.presistentContainer.viewContext
            context.delete(company)
            
            do {
                try context.save()
            } catch let saveError {
                print("Failed to delete company:", saveError)
            }
        }
        
        deleteAction.backgroundColor = UIColor.lightRed
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: editActionHandler)
        editAction.backgroundColor = UIColor.darkGrayBlue
        
        return [deleteAction, editAction]
    }
    
    private func editActionHandler(action: UITableViewRowAction, indexPath: IndexPath) {
        print("Editing company in seperate function")
        
        let editCompanyController = CreateCompanyController()
        editCompanyController.company = companies[indexPath.row]
        editCompanyController.delegate = self
        
        let navController = CustomNavigationController(rootViewController: editCompanyController)
        
        present(navController, animated: true, completion: nil)
    }
    
    // MARK:- Methods for the header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // MARK: - Methods for the footer
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "No companies available..."
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return companies.count == 0 ? 150: 0
    }
}





