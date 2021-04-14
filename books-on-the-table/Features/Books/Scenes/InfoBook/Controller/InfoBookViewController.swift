//
//  InfoBookViewController.swift
//  books-on-the-table
//
//  Created by administrator on 4/11/21.
//

import UIKit

class InfoBookViewController: UIViewController {
    
    // MARK: - Variables
    var book: Book? = nil
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleBookLabel: UILabel!
    @IBOutlet weak var authorBookLabel: UILabel!
    @IBOutlet weak var genreBookLabel: UILabel!
    @IBOutlet weak var statusBookLabel: UILabel!
    @IBOutlet weak var markButton: UIButton!
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        
        guard let bookSelected = book else { return }
        
        titleBookLabel.text = bookSelected.title.uppercased()
        authorBookLabel.text = bookSelected.author
        genreBookLabel.text = bookSelected.type.rawValue
        statusBookLabel.text = bookSelected.status.rawValue
        
        switch bookSelected.status {
        case .done:
            markButton.isEnabled = false
            markButton.backgroundColor = .lightGray
            markButton.setTitle("LIVRO JÁ LIDO", for: .disabled)
            break
        case .reading:
            markButton.setTitle("MARCAR COMO LIDO", for: .normal)
            break
        case .toRead:
            markButton.setTitle("MARCAR COMO LENDO", for: .normal)
            break
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func markAsReadBook() {
        print("change book to read")
    }
    @IBAction func backButton() {
        dismiss(animated: true)
    }
}
