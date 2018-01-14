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
            return []
        }
        
    }
    
    // LOOK HERE 
    func createEmployee(employeeName: String) -> (Employee?, Error?) {
        let context = persistentContainer.viewContext
        
        // create employee
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
        
        employee.setValue(employeeName, forKey: "name")
        
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
