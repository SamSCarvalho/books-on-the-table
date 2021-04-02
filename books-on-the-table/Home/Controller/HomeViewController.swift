//
//  ViewController.swift
//  books-on-the-table
//
//  Created by administrator on 3/30/21.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Variables
    
    let listBooksBySection: Array<SectionBooks> = BookDAO().retornaTodosLivros()

    // MARK: - Outlets
    
    @IBOutlet weak var searchInput: UISearchBar!
    @IBOutlet weak var tableBooks: UITableView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchInput.delegate = self
        tableBooks.delegate = self
        tableBooks.dataSource = self
//        booksCollectionView.dataSource = self
//        booksCollectionView.delegate = self
    }
    
    // MARK: - SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    // MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listBooksBySection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        
        cell.sectionIndex = indexPath.section
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listBooksBySection[section].title.uppercased()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width - 10, height: headerView.frame.height - 10)
        label.text = listBooksBySection[section].title.uppercased()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .orange
        
        headerView.addSubview(label)
        
        return headerView
    }
    

    // MARK: - CollectionView
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
////        return listBooksBySection.count
//        return 1
//    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return listBooksBySection[section].books.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaLivro", for: indexPath) as! BookCollectionViewCell
//        
//        let books = listBooksBySection[indexPath.section].books
//        let book = books[indexPath.row]
//        
//        cell.tituloLabel.text = book.title
//        cell.autorLabel.text = book.author
//        cell.layer.borderWidth = 0.5
//        cell.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
//        cell.layer.cornerRadius = 8
//        
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.width / 3 - 15, height: 100)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
//        
//        sectionHeader.titleLabel.text = listBooksBySection[indexPath.section].title.uppercased()
//        
//        return sectionHeader
//    }
    
    
}

