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
        
        setupNavigationBarStyles()
        setupNavigationBarButton()
        
        tableView.register(BookCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(white: 1, alpha: 0.3)
        tableView.separatorColor = UIColor(white: 1, alpha: 0.2)
        
        navigationItem.title = "Kindle"
//        setUpBooks()
        fetchBooks()
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        
        let segmentedControl = UISegmentedControl(items: ["Cloud", "Device"])
        segmentedControl.tintColor = .white
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(segmentedControl)
        
        segmentedControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        let gridButton = UIButton(type: .system)
        gridButton.setImage(#imageLiteral(resourceName: "grid").withRenderingMode(.alwaysOriginal), for: .normal)
        gridButton.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(gridButton)
        
        gridButton.leftAnchor.constraint(equalTo: footerView.leftAnchor, constant: 8).isActive = true
        gridButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        gridButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        gridButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        let sortButton = UIButton(type: .system)
        sortButton.setImage(#imageLiteral(resourceName: "sort").withRenderingMode(.alwaysOriginal), for: .normal)
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(sortButton)
        
        sortButton.rightAnchor.constraint(equalTo: footerView.rightAnchor, constant: -8).isActive = true
        sortButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        sortButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sortButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func setupNavigationBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "amazon_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAmazonIconPressed))
        
    }
    
    @objc func handleAmazonIconPressed() {
        print("Amazon icon pressed")
    }
    
    @objc func handleMenuPressed() {
        print("Menu pressed")
    }
    
    func setupNavigationBarStyles() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    func fetchBooks() {
        print("Fetching books...")
        if let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if let error = error {
                    print("Failed to fetch external json books:", error)
                    return
                }
//                print(response)

                guard let data = data else { return }
                
                // Try to parse Json but if it doesn't work throw an error message
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    
                    guard let bookDictionaries = json as? [[String: Any]] else { return }
                    
                    self.books = []
                    for bookDictionary in bookDictionaries {
                        
                        let book = Book(dictionary: bookDictionary)
                        self.books?.append(book)
//                        if let title = bookDictionary["title"] as? String, let author = bookDictionary["author"] as? String {
//                            let book = Book(title: title, author: author, image: #imageLiteral(resourceName: "steve_jobs"), pages: [])
//                            self.books?.append(book)
//                        }
                    }
                    
//                    print("All of our books:", self.books)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch let jsonError {
                    print("Failed to parse JSON properly:", jsonError)
                }
                
//                guard let dataString = String(data: data, encoding: .utf8) else { return }
//                print(dataString)
                
            }).resume()
            
//            print("Have we fetched our books yet?")
        }
    }
    
//    func setUpBooks() {
//        let page1 = Page(number: 1, text: "Text for the first page")
//        let page2 = Page(number: 2, text: "This text for the second page")
//
//        let pages = [page1, page2]
//
//        let book1 = Book(title: "Steve Jobs", author: "Walter Issacson", image: #imageLiteral(resourceName: "steve_jobs"), pages: pages)
//
//        let book2 = Book(title: "Bill Gates Biography", author: "Michael Becraft", image: #imageLiteral(resourceName: "bill_gates"), pages: [
//            Page(number: 1, text: "Text for page 1"),
//            Page(number: 2, text: "Text for page 2"),
//            Page(number: 3, text: "Text for page 3"),
//            Page(number: 4, text: "Text for page 4")
//            ])
//
//        self.books = [book1, book2]
//    }
    
}

// UITableViewController Delegate and DataSource Methods
extension ViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedBook = self.books?[indexPath.item]
        // Setup collection view layout 
        let layout = UICollectionViewFlowLayout()
        let bookPageController = BookPagerController(collectionViewLayout: layout)
        
        bookPageController.book = selectedBook
        
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
        guard let unwrappedBooks = books else { return 0 }
        return unwrappedBooks.count
    }
    
}





