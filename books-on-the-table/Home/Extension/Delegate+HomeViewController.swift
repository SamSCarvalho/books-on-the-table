//
//  Delegate+HomeViewController.swift
//  books-on-the-table
//
//  Created by administrator on 4/7/21.
//

import UIKit

extension HomeViewController: UITableViewDelegate {
    
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
}
