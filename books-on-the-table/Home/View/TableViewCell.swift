//
//  TableViewCell.swift
//  books-on-the-table
//
//  Created by administrator on 4/1/21.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate  {
    
    // MARK: - Variables
    
    var books: [Book] = []
    var controller: UIViewController? = nil
    
    // MARK: - Outlets
    @IBOutlet weak var booksCollectionView: UICollectionView!
    
    
    // MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
        booksCollectionView.dataSource = self
        booksCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Collection

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaLivro", for: indexPath) as! BookCollectionViewCell

        let book = books[indexPath.row]
        
        cell.tituloLabel.text = book.title
        cell.autorLabel.text = book.author
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 3 - 15, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(books[indexPath.row])
        
        let storyboardBook = UIStoryboard(name:"Book", bundle: nil)
        let viewController = storyboardBook.instantiateViewController(identifier: "infoBook")
        
        guard let fatherController = controller else { return }
        
        fatherController.present(viewController, animated: true)
    }
}
