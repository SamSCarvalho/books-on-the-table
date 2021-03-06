//
//  TabBar+HomeViewController.swift
//  books-on-the-table
//
//  Created by administrator on 4/7/21.
//

import UIKit

extension HomeViewController: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let storyboardBook = UIStoryboard(name:"Book", bundle: nil)
        let viewController = storyboardBook.instantiateViewController(identifier: "formBook")
        
        guard let formViewController = viewController as? FormBookViewController else { return }
        formViewController.token = token

        present(formViewController, animated: true)
        
    }
}
