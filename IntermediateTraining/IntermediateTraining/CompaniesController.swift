//
//  ViewController.swift
//  IntermediateTraining
//
//  Created by Uchenna  Aguocha on 12/29/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class CompaniesController: UITableViewController {

    let cellId = "cellId" // is the identifier for the tableView.dequeueReusableCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        setupTableViewStyle()
        setupNavigationItem()
        setupNavigationStyle()
    }
    
    func setupTableViewStyle() {
        
        tableView.backgroundColor = .darkGrayBlue
        // Used separatorStyle to remove the lines that come with the tableView
        //tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
    
    // This func setups the navigation bar item
    func setupNavigationItem() {
        navigationItem.title = "Companies"
        // Adding the plus sign image as the right bar button item
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddCompany))
    }
    
    @objc func handleAddCompany() {
        print("Adding company...")
    }
    
    // This func setups the navigation bar style
    func setupNavigationStyle() {
        
        // This will set the nav bar color to a light red color
        navigationController?.navigationBar.barTintColor = .lightRed
        // This will disable the navbar's translucency
        navigationController?.navigationBar.isTranslucent = false
        // When the tablview is scrolled, this will resize the title text
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        // This will make nav bar's font bold
        navigationController?.navigationBar.prefersLargeTitles = true
        // Set the color of the font to white
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}

// TableView Delegate and DataSource Methods
// These methods will configure the cells within the tableView
extension CompaniesController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.backgroundColor = .tealColor
        
        cell.textLabel?.text = "The Company"
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}





