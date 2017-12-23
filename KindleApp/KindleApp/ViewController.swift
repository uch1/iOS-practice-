//
//  ViewController.swift
//  KindleApp
//
//  Created by Uchenna  Aguocha on 12/22/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let page1 = Page(number: 1, text: "Text for the first page")
        let page2 = Page(number: 2, text: "This text for the second page")
        
        let pages = [page1, page2]
        
        let book = Book(title: "Steve Jobs", author: "Walter Issacson", pages: pages)

//        let firstPage = book.pages[0]
        
//        if page.number == 2 {
//            print(firstPage.text)
//        }
//
//        for page in book.pages {
//
//            if page.number == 1 {
//                print(page.text)
//            }
//
//        }
        
        let book2 = Book(title: "Bill Gates Biography", author: "Michael Becraft", pages: [
            Page(number: 1, text: "Text for page 1"),
            Page(number: 2, text: "Text for page 2"),
            Page(number: 3, text: "Text for page 3"),
            Page(number: 4, text: "Text for page 4")
            ])
        
        for book in [book, book2] {
            print(book.title)
            for page in book.pages {
                print(page.text)
            }
        }
        
    }

}

