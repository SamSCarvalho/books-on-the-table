//
//  FormBookViewController.swift
//  books-on-the-table
//
//  Created by administrator on 4/1/21.
//

import UIKit

class FormBookViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Variables
    let typesArray = Book.Genre.allCases
    let statusArray = Book.Status.allCases
    var token : Token? = nil

    // MARK: - Outlets

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var typePickerView: UIPickerView!
    @IBOutlet weak var statusPickerView: UIPickerView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typePickerView.dataSource = self
        typePickerView.delegate = self
        statusPickerView.dataSource = self
        statusPickerView.delegate = self
    }
    
    // MARK: - Actions

    @IBAction func backButton() {
        dismiss(animated: true)
    }
    
    @IBAction func saveBook() {
        guard let title = titleTextField.text else { return }
        guard let author = authorTextField.text else { return }
        let type = typesArray[typePickerView.selectedRow(inComponent: 0)]
        let status = statusArray[statusPickerView.selectedRow(inComponent: 0)]
        
        let newBook = Book(title: title, author: author, type: type, status: status)
        
        guard let token = token?.token else { return }
        
        APIs().books.create(book: newBook, token: token)

        dismiss(animated: true)
    }
    
    // MARK: - PickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let indentifier = pickerView.restorationIdentifier else { return 0 }
        
        if (indentifier == "type") {
            return typesArray.count
        } else {
            return statusArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let indentifier = pickerView.restorationIdentifier else { return nil }
        
        if (indentifier == "type") {
            return typesArray[row].rawValue as String
        } else {
            return statusArray[row].rawValue as String
        }
    }
}
