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
        employees.append(employee)
        tableView.reloadData()
    }
    
}
