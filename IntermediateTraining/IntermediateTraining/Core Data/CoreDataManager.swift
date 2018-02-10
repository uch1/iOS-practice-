//
//  CoreDataManager.swift
//  IntermediateTraining
//
//  Created by Uchenna  Aguocha on 1/1/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import CoreData

struct CoreDataManager {
    
    static let shared = CoreDataManager() // will live forever as long as your application is stil alive, and it's properties will too
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IntermediateTrainingModels")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store failed: \(error)")
            }
        }
        return container
    }()
    
    func fetchCompanies() -> [Company] {
        
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        
        do {
            let companies = try context.fetch(fetchRequest)
            return companies
        } catch let fetchError {
            print("Failed to fetch error:", fetchError)
            return []         }
        
    }
    
    // LOOK HERE 
    func createEmployee(employeeName: String, employeeType: String, birthday: Date, company: Company) -> (Employee?, Error?) {
        let context = persistentContainer.viewContext
        
        // create employee
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
        
        employee.company = company
        employee.type = employeeType
        //employee.type = employeeType
//        let company = Company(context: context)
//        company.employees
//        
//        employee.company
        
        employee.setValue(employeeName, forKey: "name")
        
        // create employee information
        let employeeInformation = NSEntityDescription.insertNewObject(forEntityName: "EmployeeInformation", into: context) as! EmployeeInformation
        
        employeeInformation.taxId = "456"
        employeeInformation.birthday = birthday
        
        //employeeInformation.setValue("456", forKey: "taxId")
        employee.employeeInformation = employeeInformation
        
        do {
            try context.save()
            // save succeeds
            return (employee, nil)
            
        } catch let error {
            print("Failed to create employee:", error)
            return (nil, error)
        }
        
    }
    
}
