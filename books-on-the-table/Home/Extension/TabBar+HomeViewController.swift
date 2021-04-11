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
        
        let context = CoreDataStack(containerName: "Model").persistentContainer.viewContext
        let result = EntityBook.all(in: context)
        print(result)
//        present(viewController, animated: true)
    }
}