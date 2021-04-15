//
//  DataSource+HomeViewController.swift
//  books-on-the-table
//
//  Created by administrator on 4/7/21.
//

import UIKit

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listBooksBySection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        
        cell.books = listBooksBySection[indexPath.section].booksFiltered(filter)
        cell.token = token
        cell.booksCollectionView.reloadData()
        cell.controller = self
        
        return cell
    }
}
