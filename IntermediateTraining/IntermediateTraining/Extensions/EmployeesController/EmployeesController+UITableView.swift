//
//  EmployeesController+UITableView.swift
//  IntermediateTraining
//
//  Created by Uchenna  Aguocha on 1/13/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit

extension EmployeesController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allEmployees[section].count
        
//        if section == 0 {
//            return shortNameEmployees.count
//        }
//        return longNameEmployees.count
        //return employees.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return allEmployees.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
//        if indexPath.section == 0 {
//
//        }
        
        // use a ternary operator
        //let employee = employees[indexPath.row]
        //let employee = indexPath.section == 0 ? shortNameEmployees[indexPath.row] : longNameEmployees[indexPath.row]
        
        let employee = allEmployees[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = employee.name
        
        if let birthday = employee.employeeInformation?.birthday {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            
            cell.textLabel?.text = "\(employee.name ?? "") \(dateFormatter.string(from: birthday))"
        }
        
//        if let taxId = employee.employeeInformation?.taxId {
//            cell.textLabel?.text = "\(employee.name ?? "")   \(taxId)"
//        }
        
        cell.backgroundColor = UIColor.tealColor
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        return cell
    }
    
    
    // Create Seperate Headers
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = IndentedLabel()
        
//        if section == 0 {
//            label.text = EmployeeType.Executive.rawValue
//        } else if section == 1 {
//            label.text = EmployeeType.SeniorManagement.rawValue
//        } else {
//            label.text = EmployeeType.Staff.rawValue
//        }
        
        label.text = employeeTypes[section]
        label.backgroundColor = UIColor.lightBlue
        label.textColor = UIColor.darkGrayBlue
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}













