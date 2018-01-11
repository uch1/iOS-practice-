//
//  CompaniesController+CreateCompany.swift
//  IntermediateTraining
//
//  Created by Uchenna  Aguocha on 1/11/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import UIKit

extension CompaniesController: CreateCompanyControllerDelegate {
    
    // specify your extension methods here...
    
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
