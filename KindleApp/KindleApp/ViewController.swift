//
//  ViewController.swift
//  KindleApp
//
//  Created by Uchenna  Aguocha on 12/22/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let cellId = "cellId"
    
    var books: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BookCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
        navigationItem.title = "Kindle"
        setUpBooks()
    }

    func setUpBooks() {
        let page1 = Page(number: 1, text: "Text for the first page")
        let page2 = Page(number: 2, text: "This text for the second page")
        
        let pages = [page1, page2]
        
        let book1 = Book(title: "Steve Jobs", author: "Walter Issacson", image: #imageLiteral(resourceName: "steve_jobs"), pages: pages)
        
        let book2 = Book(title: "Bill Gates Biography", author: "Michael Becraft", image: #imageLiteral(resourceName: "bill_gates"), pages: [
            Page(number: 1, text: "Text for page 1"),
            Page(number: 2, text: "Text for page 2"),
            Page(number: 3, text: "Text for page 3"),
            Page(number: 4, text: "Text for page 4")
            ])
        
        self.books = [book1, book2]
    }
    
}

// UITableViewController Delegate and DataSource Methods
extension ViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Setup collection view layout 
        let layout = UICollectionViewFlowLayout()
        let bookPageController = BookPagerController(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: bookPageController)
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BookCell
        let book = books?[indexPath.row]
        
        cell.book = book
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if count = books?.count {
//            return count
//        }
//        return 0
        guard let unwrappedBooks = books else { return 0 }
        return unwrappedBooks.count
    }
    
}





