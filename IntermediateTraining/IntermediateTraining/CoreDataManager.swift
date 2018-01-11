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
    
    let presistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IntermediateTrainingModels")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store failed: \(error)")
            }
        }
        return container
    }()
    
    func fetchCompanies() -> [Company] {
        
        let context = presistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        
        do {
            let companies = try context.fetch(fetchRequest)
            return companies
        } catch let fetchError {
            print("Failed to fetch error:", fetchError)
            return []
        }
        
    }
    
    
}
