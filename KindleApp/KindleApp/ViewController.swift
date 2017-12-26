//
//  ViewController.swift
//  KindleApp
//
//  Created by Uchenna  Aguocha on 12/22/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var books: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Kindle"
        view.backgroundColor = .red
        setUpBooks()
    }

    func setUpBooks() {
        let page1 = Page(number: 1, text: "Text for the first page")
        let page2 = Page(number: 2, text: "This text for the second page")
        
        let pages = [page1, page2]
        
        let book1 = Book(title: "Steve Jobs", author: "Walter Issacson", pages: pages)
        
        let book2 = Book(title: "Bill Gates Biography", author: "Michael Becraft", pages: [
            Page(number: 1, text: "Text for page 1"),
            Page(number: 2, text: "Text for page 2"),
            Page(number: 3, text: "Text for page 3"),
            Page(number: 4, text: "Text for page 4")
            ])
        
        self.books = [book1, book2]
        
        //        guard let books = self.books else { return }
        //        for book in books {
        //            print(book.title)
        //            for page in book.pages {
        //                print(page.text)
        //            }
        //        }
        
        if let unwrappedBooks = self.books {
            for book in unwrappedBooks {
                print(book.title)
                for page in book.pages {
                    print(page.text)
                }
            }
        }

    }
    
}

