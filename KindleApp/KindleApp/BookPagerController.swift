//
//  BookPagerController.swift
//  KindleApp
//
//  Created by Uchenna  Aguocha on 12/26/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class BookPagerController: UICollectionViewController {
    
    let cellId = "cellId" //ResuseIdentifier
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = self.book?.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseBook))
        setupCollectionViewLayout()
    }
    
}

// MARK: Methods
extension BookPagerController {
    
    @objc func handleCloseBook() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupCollectionViewLayout() {
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.isPagingEnabled = true
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0
    }
    
}

// MARK: UICollectionView Delegate and DataSource Methods
extension BookPagerController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 44 - 20)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //guard let unwrappedBookPageCount = book?.pages.count else { return 0 }
        // If book pages aren't found then return 0
        return book?.pages.count ?? 0
        //return unwrappedBookPageCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        let page = book?.pages[indexPath.item]
        pageCell.textLabel.text = page?.text
        
        return pageCell
    }
    
}












