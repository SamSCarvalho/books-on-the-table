//
//  ViewController.swift
//  books-on-the-table
//
//  Created by administrator on 3/30/21.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    // MARK: - Variables
    
    let listBooksBySection: Array<SectionBooks> = BookDAO().retornaTodosLivros()

    // MARK: - Outlets
    
    @IBOutlet weak var searchInput: UISearchBar!
    @IBOutlet weak var booksCollectionView: UICollectionView!
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchInput.delegate = self
        booksCollectionView.dataSource = self
        booksCollectionView.delegate = self
    }
    
    // MARK: - SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }

    // MARK: - CollectionView
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return listBooksBySection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listBooksBySection[section].books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaLivro", for: indexPath) as! BookCollectionViewCell
        
        let books = listBooksBySection[indexPath.section].books
        let book = books[indexPath.row]
        
        cell.tituloLabel.text = book.title
        cell.autorLabel.text = book.author
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 3 - 15, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
        
        sectionHeader.titleLabel.text = listBooksBySection[indexPath.section].title.uppercased()
        
        return sectionHeader
    }
}

