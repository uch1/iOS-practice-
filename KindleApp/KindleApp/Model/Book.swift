//
//  Book.swift
//  KindleApp
//
//  Created by Uchenna  Aguocha on 12/22/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class Book {
    let title: String
    let author: String
//    let image: UIImage
    let pages: [Page]
    let coverImageUrl: String
    
//    init(title: String, author: String, image: UIImage, pages: [Page]) {
//        self.title = title
//        self.author = author
//        self.image = image
//        self.pages = pages
//        self.coverImageUrl = ""
//    }
    
    init(dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.author = dictionary["author"] as? String ?? ""
        self.coverImageUrl = dictionary["coverImageUrl"] as? String ?? ""
        
//        self.image = #imageLiteral(resourceName: "steve_jobs")
        
        var bookPages = [Page]()
        
        if let pageDictionaries = dictionary["pages"] as? [[String: Any]] {
            for pageDictionary in pageDictionaries {
                if let pageText = pageDictionary["text"] as? String {
                    let page = Page(number: 1, text: pageText)
                    bookPages.append(page)
                }
            }
        }
        
        self.pages = bookPages
    }
}

class Page {
    let number: Int
    let text: String
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text 
    }
}



