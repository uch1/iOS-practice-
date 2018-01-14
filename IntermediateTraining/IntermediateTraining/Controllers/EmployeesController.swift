//
//  EmployeesController.swift
//  IntermediateTraining
//
//  Created by Uchenna  Aguocha on 1/11/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit
import CoreData

class EmployeesController: UITableViewController {
    
    let cellID = "cellID"
    
    var company: Company?
    
    var employees = [Employee]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = company?.name
        
    }
    
    private func fetchEmployees() {
        print("Trying to fetch employees..")
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        
        do {
            let employees = try context.fetch(request)
            
            self.employees = employees
            print(self.employees)
            //employees.forEach{ print("Employee name:", $0.name ?? "")}
            
        } catch let error {
            print("Failed to fetch employees:", error)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchEmployees()
        
        tableView.backgroundColor = UIColor.darkGrayBlue
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        setupPlusButtonInNavBar(selector: #selector(handleAddEmployee))
    }
    
    @objc func handleAddEmployee() {
        print("Trying to add an employee...")
        
        let createEmployeeController = CreateEmployeeController()
        createEmployeeController.delegate = self
        
        let navController = UINavigationController(rootViewController: createEmployeeController)
        
        present(navController, animated: true, completion: nil)
    }
    
}
