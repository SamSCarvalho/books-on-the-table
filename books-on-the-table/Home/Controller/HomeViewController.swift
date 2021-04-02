//
//  ViewController.swift
//  books-on-the-table
//
//  Created by administrator on 3/30/21.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate {
    
    // MARK: - Variables
    
    let listBooksBySection: Array<SectionBooks> = BookDAO().retornaTodosLivros()

    // MARK: - Outlets
    
    @IBOutlet weak var searchInput: UISearchBar!
    @IBOutlet weak var tableBooks: UITableView!
    @IBOutlet weak var addTabBar: UITabBar!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchInput.delegate = self
        tableBooks.delegate = self
        tableBooks.dataSource = self
        addTabBar.delegate = self
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
    
    // MARK: - TabBar
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let storyboardBook = UIStoryboard(name:"Book", bundle: nil)
        let viewController = storyboardBook.instantiateViewController(identifier: "formBook")
        
//        navigationController?.pushViewController(viewController, animated: true)
        present(viewController, animated: true)
    }
    
}

