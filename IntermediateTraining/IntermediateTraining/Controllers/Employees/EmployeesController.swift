//
//  EmployeesController.swift
//  IntermediateTraining
//
//  Created by Uchenna  Aguocha on 1/11/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit
import CoreData

class IndentedLabel: UILabel {
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        let customRect = UIEdgeInsetsInsetRect(rect, insets)
        super.drawText(in: customRect)
    }
    
}

class EmployeesController: UITableViewController {
    
    let cellID = "cellID"
    
    var company: Company?
    
    var employees = [Employee]()
    var shortNameEmployees = [Employee]()
    var longNameEmployees = [Employee]()
    var reallyLongNameEmployees = [Employee]()
    
    var allEmployees = [[Employee]]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = company?.name
        
    }
    
    private func fetchEmployees() {
        guard let companyEmployees = company?.employees?.allObjects as? [Employee] else { return }
    
        shortNameEmployees = companyEmployees.filter({ (employee) -> Bool in
            
            if let count = employee.name?.count {
                return count < 6
            }
            return false
        })
        
        longNameEmployees = companyEmployees.filter({ (employee) -> Bool in
            
            if let count = employee.name?.count {
                return count > 6 && count < 9
            }
            return false
        })
        
        reallyLongNameEmployees = companyEmployees.filter({ (employee) -> Bool in
            
            if let count = employee.name?.count {
                return count > 9
            }
            return false
        })
        
        allEmployees = [shortNameEmployees, longNameEmployees, reallyLongNameEmployees]
        
        print(shortNameEmployees.count, longNameEmployees.count, reallyLongNameEmployees.count)
        
//        self.employees = companyEmployees
        
//        print("Trying to fetch employees..")
//
//        let context = CoreDataManager.shared.persistentContainer.viewContext
//
//        let request = NSFetchRequest<Employee>(entityName: "Employee")
//
//        do {
//            let employees = try context.fetch(request)
//
//            self.employees = employees
//            print(self.employees)
//            //employees.forEach{ print("Employee name:", $0.name ?? "")}
//
//        } catch let error {
//            print("Failed to fetch employees:", error)
//        }
        
        
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
        createEmployeeController.company = company
        let navController = UINavigationController(rootViewController: createEmployeeController)
        
        present(navController, animated: true, completion: nil)
    }
    
}
