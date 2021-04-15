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
    let statusArray = Book.Status.allCases
    var token : Token? = nil
    
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
        guard var bookSelected = book else { return }
        
        switch bookSelected.status {
            case .toRead:
                bookSelected.status = .reading
            case .reading:
                bookSelected.status = .done
            default:
                break
        }
        
        guard let bookId = bookSelected.id else { return }
        
        guard let token = token?.token else { return }
        
        APIs().books.update(book: bookSelected, bookId: bookId, token: token)
        
        dismiss(animated: true)
    }
    
    @IBAction func backButton() {
        dismiss(animated: true)
    }
}
