//
//  EmployeesController+CreateEmployee.swift
//  IntermediateTraining
//
//  Created by Uchenna  Aguocha on 1/14/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit

extension EmployeesController: CreateEmployeeControllerDelegate {
    
    func didAddEmployee(employee: Employee) {
        // employees.append(employee)
//        fetchEmployees()
//        tableView.reloadData()
        
        
        guard let section = employeeTypes.index(of: employee.type!) else { return }
        
        let row = allEmployees[section].count
        
        // what is the insertion index path?
        let insertionIndexPath = IndexPath(row: row, section: section)
        
        allEmployees[section].append(employee)
        
        tableView.insertRows(at: [insertionIndexPath], with: .middle)
    }
    
}
