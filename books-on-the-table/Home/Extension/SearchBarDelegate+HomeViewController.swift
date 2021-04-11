//
//  SearchBarDelegate+HomeViewController.swift
//  books-on-the-table
//
//  Created by administrator on 4/7/21.
//

import UIKit

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filter = searchText
        tableBooks.reloadData()
    }
    
}
