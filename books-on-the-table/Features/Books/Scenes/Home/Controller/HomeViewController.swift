//
//  ViewController.swift
//  books-on-the-table
//
//  Created by administrator on 3/30/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Variables
    
    var listBooksBySection: Array<SectionBooks> = []
    var token : Token? = nil
    var filter = ""

    // MARK: - Outlets
    
    @IBOutlet weak var searchInput: UISearchBar!
    @IBOutlet weak var tableBooks: UITableView!
    @IBOutlet weak var addTabBar: UITabBar!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Extension
        searchInput.delegate = self
        tableBooks.delegate = self
        tableBooks.dataSource = self
        addTabBar.delegate = self
        
        consultBooks()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        consultBooks()
    }

    
    // MARK: - Functions
    
    func consultBooks() {
        let stack = CoreDataStack(containerName: "Model")
        let context = stack.persistentContainer.viewContext
        
        guard  let tokenObject = token else { return }
        
        APIs().books.allBooks(token: tokenObject.token ) { (result: Result<BookList, Error>) in
            switch (result) {
                case .success(let returnedBookList):
                    let bookList = returnedBookList.bookList
                    for book in bookList {
                        EntityBook.book(book: book, in: context)
                    }
                    stack.saveContext()
                    self.listBooksBySection = SectionBooksList(bookList: bookList).sections
                    self.tableBooks.reloadData()
                case .failure(let error):
                    print("returned error: \(error)")
            }
        }
    }
}

