//
//  CompaniesAutoUpdateController.swift
//  IntermediateTraining
//
//  Created by Uchenna  Aguocha on 2/10/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit
import CoreData

class CompaniesAutoUpdateController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let cellId = "cellId"
    
    // warning: this code here is going to be a bit of a monster
    lazy var fetchedResultsController: NSFetchedResultsController<Company> = {
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let request: NSFetchRequest<Company> = Company.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "name", ascending: true)
        ]
        
        let frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: "name", cacheName: nil)
        
        frc.delegate = self
        
        do {
            try frc.performFetch()
        } catch let error {
            print(error)
        }
        
        return frc
    }()
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        case .move:
            break
        case .update:
            break
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, sectionIndexTitleForSectionName sectionName: String) -> String? {
        return sectionName
    }
    
    @objc private func handleAdd() {
        print("Let's add a company called BMW")
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let company = Company(context: context)
        company.name = "BWM"
        
        do {
            try context.save()
            
        } catch let saveError {
            print("Failed to save:", saveError)
        }
    }
    
    @objc private func handleDelete() {
        
        let request: NSFetchRequest<Company> = Company.fetchRequest()
        request.predicate = NSPredicate(format: "name CONTAINS %@", "c")
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let companiesWithB = try? context.fetch(request)
        
        companiesWithB?.forEach({ (company) in
            context.delete(company)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Company Auto Updates"
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(handleAdd)),
            UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(handleDelete))
        ]
        
        tableView.backgroundColor = UIColor.darkGrayBlue
        tableView.register(CompanyCell.self, forCellReuseIdentifier: cellId)
        
        fetchedResultsController.fetchedObjects?.forEach({ (company) in
            print(company.name ?? "")
        })
    }
    
}

extension CompaniesAutoUpdateController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchedResultsController.sections![section].numberOfObjects
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = IndentedLabel()
        label.text = fetchedResultsController.sectionIndexTitles[section]
        label.backgroundColor = UIColor.lightBlue
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CompanyCell
        
        let company = fetchedResultsController.object(at: indexPath)
        
        //cell.textLabel?.text = company.name
        cell.company = company
        
        return cell
    }
    
}

















